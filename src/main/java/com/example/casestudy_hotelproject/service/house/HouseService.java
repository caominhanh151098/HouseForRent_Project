package com.example.casestudy_hotelproject.service.house;

import com.example.casestudy_hotelproject.model.*;
import com.example.casestudy_hotelproject.repository.*;
import com.example.casestudy_hotelproject.service.ShowBedDetailResponse;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.house.request.HouseRequest;
import com.example.casestudy_hotelproject.service.house.response.HouseOfHostReponse;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowMiniReviewResponse;
import com.example.casestudy_hotelproject.service.room.ShowRoomDetailResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class HouseService {
    private final HouseRepository houseRepository;
    private final ComfortableRepository comfortableRepository;
    private final ComfortableService comfortableService;

    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        Page<House> listHouse = houseRepository.findAll(pageable);


        Page<ShowListHouseResponse> listPageHouse = listHouse.map(e -> AppUtils.mapper.map(e, ShowListHouseResponse.class));
        for (int index = 0; index < listPageHouse.getContent().size(); index++) {
            House house = listHouse.getContent().get(index);
            ShowListHouseResponse houseResp = listPageHouse.getContent().get(index);
            String typeHouse = house.getCategoryHotel().getName();
            String addressHouse = house.getLocation().getAddress();
            listPageHouse.getContent().get(index).setTitle(String.format("%s Tại %s", typeHouse, addressHouse));
            int numReview = house.getReviews().size();
            if (numReview > 1)
                houseResp.setReview(String.format("%s (%s)", house.getAvgReviewPoint(), numReview));
            else houseResp.setReview("Mới");
        }

        return listPageHouse;
    }
    public List<HouseOfHostReponse> showHouseOfHost(int id){
        List<House> houseList =houseRepository.findByUser_Id(id);
        List<HouseOfHostReponse> reponseList=houseList.stream().map(e-> AppUtils.mapper.map(e,HouseOfHostReponse.class)).collect(Collectors.toList());
        return reponseList;
    }
    public void createHouse(HouseRequest houseRequest){
        House house= AppUtils.mapper.map(houseRequest,House.class);
        house.setDescription(new Description(houseRequest.getDescriptions()));
        house.setCategoryHotel(new CategoryHotel(Integer.parseInt(houseRequest.getCategoryHotel()) ));
        house.setLocation(new Location(houseRequest.getAddress()));
        List<Image> images=new ArrayList<>();
        for (var item:houseRequest.getImageList()
             ) {
            images.add(new Image(house, item));
        }
        house.setImages(images);
//        List<ComfortableDetail> comfortables=new ArrayList<>();
//
//        house.setComfortableDetails(comfortables);
        houseRepository.save(house);
        for (var item:houseRequest.getComfortableDetailList()
        ) {
            comfortableService.createComfortableDetail(new ComfortableDetail(house,new Comfortable(Integer.parseInt(item))));
        }
    }

    public HouseOfHostReponse  getHouseOfHostDetail(int id){
        House house =houseRepository.findById(id);
        HouseOfHostReponse houseRespone = AppUtils.mapper.map(house,HouseOfHostReponse.class);
        return houseRespone;
    }
    public ShowHouseDetailResponse showDetail(int idHouse) {
        House house = houseRepository.findById(idHouse);

        ShowHouseDetailResponse houseResp = AppUtils.mapper.map(house, ShowHouseDetailResponse.class);
        houseResp.setNumReview(house.getReviews().size());
        if (!house.getRooms().isEmpty())
            houseResp.setRooms(fixInfoRooms(house.getRooms()));

        switch (house.getTypeRoom()) {
            case ENTIRE_PLACE ->
                    houseResp.setTitle(String.format("%s %s", house.getTypeRoom().getLangVi(), house.getCategoryHotel().getName()));
            case SHARED_ROOM ->
                    houseResp.setTitle(String.format("%s tại %s", house.getTypeRoom().getLangVi(), house.getCategoryHotel().getName()));
            case ROOM ->
                    houseResp.setTitle(String.format("%s ở %s", house.getTypeRoom().getLangVi(), house.getCategoryHotel().getName()));
        }
        if (house.getReviews().size() <= 1)
            houseResp.setReviewPoint("Mới");
        else
            houseResp.setReviewPoint(String.valueOf(house.getAvgReviewPoint()));

        String requestDetail = String.format("%s khách. %s phòng ngủ. %s giường. %s phòng tắm",
                house.getQuantityOfGuests(),
                house.getQuantityOfRooms(),
                house.getQuantityOfBeds(),
                house.getQuantityOfBathrooms());
        List<Comfortable> listComfortable = new ArrayList<>();
        for (ComfortableDetail comfortableDetail : house.getComfortableDetails()){
            listComfortable.add(comfortableDetail.getComfortable());
        }
        List<ShowMiniListComfortableResponse> miniListComfortable = new ArrayList<>();
        Comfortable[] comfortable = new Comfortable[2];
        comfortable[0] = comfortableRepository.findByName("Máy báo khói");
        comfortable[1] = comfortableRepository.findByName("Máy phát hiện khí CO");

        for (int index = 0; index < 8 && index < listComfortable.size(); index++) {
            miniListComfortable.add(AppUtils.mapper.map(listComfortable.get(index), ShowMiniListComfortableResponse.class));
        }
        for (int index = 0; index < 2; index++) {
            if (!checkComfortable(listComfortable, comfortable[index])) {
                ShowMiniListComfortableResponse miniComfortable = AppUtils.mapper.map(comfortable[index], ShowMiniListComfortableResponse.class);
                miniComfortable.setStatic_comfortable(false);
                miniComfortable.setIcon(comfortable[index].getIconNoneActive());
                miniListComfortable.add(miniComfortable);
            } else {
                if (miniListComfortable.size() < listComfortable.size()) {
                    miniListComfortable.add(AppUtils.mapper.map(listComfortable.get(listComfortable.size() - 1), ShowMiniListComfortableResponse.class));
                }
            }
        }

        houseResp.setMiniListComfortable(miniListComfortable);
        houseResp.setTitle(String.format("%s. Chủ nhà %s", houseResp.getTitle(), house.getUser().getLastName()));
        houseResp.setRequestDetail(requestDetail);
        houseResp.setNumComfortable(listComfortable.size());
        return houseResp;
    }

    private boolean checkComfortable(List<Comfortable> listComfortable1, Comfortable comfortable) {
        if (listComfortable1.contains(comfortable))
            return true;
        return false;
    }

    private List<ShowRoomDetailResponse> fixInfoRooms(List<Room> rooms) {
        return rooms.stream().map(room -> {
            List<String> stringBedsDetail = new ArrayList();
            List<ShowBedDetailResponse> bedDetail = new ArrayList<>();
            String srcImg = !room.getImages().isEmpty() ? room.getImages().get(0).getSrcImg() : null;
            for (Bed bed : room.getBeds()) {
                stringBedsDetail.add(String.format("%s %s", bed.getQuantity(), bed.getType().getLangVi()));
                bedDetail.add(new ShowBedDetailResponse(bed.getType().getIconPath(), bed.getQuantity()));
            }
            String beds = String.join(", ", stringBedsDetail);
            return new ShowRoomDetailResponse(room.getName(), srcImg, beds, bedDetail);
        }).collect(Collectors.toList());
    }
   public List<House> getHouseOfHost(int id){
            List<House> list=houseRepository.findByUser_Id(id);
        return list;
   }

    public ShowMiniReviewResponse showMiniReview(int idHouse) {
        House house = houseRepository.findById(idHouse);

        ShowMiniReviewResponse reviewResp = AppUtils.mapper.map(house, ShowMiniReviewResponse.class);
        return reviewResp;
    }
}
