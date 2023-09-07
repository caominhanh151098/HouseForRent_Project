package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.location.response.ShowLocationListHouseResponse;
import com.example.casestudy_hotelproject.service.room.ShowRoomDetailResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowHostAvatarResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowHouseDetailResponse {
    private String id;
    private String hotelName;
    private ShowLocationListHouseResponse location;
    private String title;
    private String requestDetail;
    private String quantityOfRooms;
    private String quantityOfBeds;
    private String description;
    private List<ShowMiniListComfortableResponse> miniListComfortable;
    private String numComfortable;
    private String reviewPoint;
    private String numReview;
    private List<ShowRoomDetailResponse> rooms;
    private List<ShowImgListResponse> images = new ArrayList<>();
    private ShowHostAvatarResponse user;

}
