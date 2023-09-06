package com.example.casestudy_hotelproject.service.house;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Room;
import com.example.casestudy_hotelproject.repository.*;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortable;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
@AllArgsConstructor
public class HouseService {
    private final HouseRepository houseRepository;
    private final ComfortableRepository comfortableRepository;
    private final RoomRepository roomRepository;
    private final ReviewRepository reviewRepository;
    private final ImageRepository imageRepository;

    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        Page<House> listHouse = houseRepository.findAll(pageable);

        Page<ShowListHouseResponse> listPageHouse = listHouse.map(e -> AppUtils.mapper.map(e, ShowListHouseResponse.class));
        for (int index = 0; index < listPageHouse.getContent().size(); index++) {
            House house = listHouse.getContent().get(index);
            String typeHouse = house.getTypeHouse().getLangVI();
            String addressHouse = house.getLocation().getAddress();
            listPageHouse.getContent().get(index).setTitle(String.format("%s Tại %s", typeHouse, addressHouse));
            if (house.getReviews().size() > 1)
                listPageHouse.getContent().get(index).setReview(String.format("%s (%s)", house.getAvgReviewPoint(), house.getReviews().size()));
            else listPageHouse.getContent().get(index).setReview("Mới");
        }

        return listPageHouse;
    }

    public ShowHouseDetailResponse showDetail(int idHouse) {
        House house = houseRepository.findById(idHouse);

        List<Room> rooms = roomRepository.findAllByHouse_Id(idHouse);
        ShowHouseDetailResponse houseResp = AppUtils.mapper.map(house, ShowHouseDetailResponse.class);
//        houseResp.setRooms(rooms);
        switch (house.getTypeRoom()) {
            case ENTIRE_PLACE ->
                    houseResp.setTitle(String.format("%s %s", house.getTypeRoom().getLangVi(), house.getTypeHouse().getLangVI()));
            case SHARED_ROOM ->
                    houseResp.setTitle(String.format("%s tại %s", house.getTypeRoom().getLangVi(), house.getTypeHouse().getLangVI()));
            case ROOM ->
                    houseResp.setTitle(String.format("%s ở %s", house.getTypeRoom().getLangVi(), house.getTypeHouse().getLangVI()));
        }
        if (house.getReviews().size() <= 1)
            houseResp.setReviewPoint("Mới");
        else
            houseResp.setReviewPoint(String.valueOf(house.getAvgReviewPoint()));
        houseResp.setNumReview(String.valueOf(house.getReviews().size()));


        String requestDetail = String.format("%s khách. %s phòng ngủ. %s giường. %s phòng tắm",
                house.getQuantityOfGuests(),
                house.getQuantityOfRooms(),
                house.getQuantityOfBeds(),
                house.getQuantityOfBathrooms());
        List<Comfortable> listComfortable = comfortableRepository.getListComfortableByHouseId(idHouse);
        List<ShowMiniListComfortable> miniListComfortable = new ArrayList<>();
        Comfortable[] comfortable = new Comfortable[2];
        comfortable[0] = comfortableRepository.findByName("Máy báo khói");
        comfortable[1] = comfortableRepository.findByName("Máy phát hiện khí CO");

        for (int index = 0; index < 8 && index < listComfortable.size(); index++) {
            miniListComfortable.add(AppUtils.mapper.map(listComfortable.get(index), ShowMiniListComfortable.class));
        }
        for (int index = 0; index < 2; index++) {
            if (!checkComfortable(listComfortable, comfortable[index])) {
                ShowMiniListComfortable miniComfortable = AppUtils.mapper.map(comfortable[index], ShowMiniListComfortable.class);
                miniComfortable.setStatic_comfortable("false");
                miniComfortable.setIcon(comfortable[index].getIconNoneActive());
                miniListComfortable.add(miniComfortable);
            } else {
                if (miniListComfortable.size() < listComfortable.size()) {
                    miniListComfortable.add(AppUtils.mapper.map(listComfortable.get(listComfortable.size() - 1), ShowMiniListComfortable.class));
                }
            }
        }

        houseResp.setMiniListComfortable(miniListComfortable);
        houseResp.setTitle(String.format("%s. Chủ nhà %s", houseResp.getTitle(), house.getUser().getLastName()));
        houseResp.setRequestDetail(requestDetail);
        houseResp.setNumComfortable(String.valueOf(listComfortable.size()));
        return houseResp;
    }

    private boolean checkComfortable(List<Comfortable> listComfortable1, Comfortable comfortable) {
        if (listComfortable1.contains(comfortable))
            return true;
        return false;
    }

    private void fixInfoRooms(List<Room> rooms) {
        rooms.stream().map(r -> {
            return null;
        });
    }
}
