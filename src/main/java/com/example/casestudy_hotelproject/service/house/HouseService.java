package com.example.casestudy_hotelproject.service.house;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.ImageRepository;
import com.example.casestudy_hotelproject.repository.ReviewRepository;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
@AllArgsConstructor
public class HouseService {
    private final HouseRepository houseRepository;
    private final ImageRepository imageRepository;
    private final ReviewRepository reviewRepository;

    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        Page<House> listHouse = houseRepository.findAll(pageable);
        listHouse.map(h -> {
            h.setImages(imageRepository.findAllByHouse_Id(h.getId()));
            h.setReviews(reviewRepository.findAllByHouse_Id(h.getId()));
            return h;
        });
        Page<ShowListHouseResponse> listPageHouse = listHouse.map(e -> AppUtils.mapper.map(e, ShowListHouseResponse.class));
        for (int index = 0; index < listPageHouse.getContent().size(); index++) {
            House house = listHouse.getContent().get(index);
            String typeHouse = house.getTypeHouse().getLangVI();
            String addressHouse = house.getLocation().getAddress();
            listPageHouse.getContent().get(index).setTitle(String.format("%s Tại %s", typeHouse, addressHouse));
            if (house.getReviews().size() > 1)
                listPageHouse.getContent().get(index).setReview(String.format("%s (%s)",house.getAvgReviewPoint(), house.getReviews().size()));
            else listPageHouse.getContent().get(index).setReview("Mới");
        }

        return listPageHouse;
    }
    public void createHouse(House house){
        houseRepository.save(house);
    }

}
