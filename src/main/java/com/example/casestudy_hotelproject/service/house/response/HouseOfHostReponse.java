package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.location.response.ShowLocationListHouseResponse;
import com.example.casestudy_hotelproject.service.room.ShowRoomDetailResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class HouseOfHostReponse {
    private String id;
    private ShowLocationListHouseResponse location;
    private String hotelName;
    private String quantityOfRooms;
    private String quantityOfBeds;
    private String quantityOfBathrooms;
    private String description;
    private String bookNow;
    private String status;
    private List<ShowImgListResponse> images = new ArrayList<>();
}
