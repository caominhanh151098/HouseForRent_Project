package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortable;
import com.example.casestudy_hotelproject.service.room.ShowRoomDetailResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowHouseDetailResponse {
    private String id;
    private String hotelName;
    private String location;
    private String title;
    private String requestDetail;
    private String quantityOfRooms;
    private String quantityOfBeds;
    private String description;
    private List<ShowMiniListComfortable> miniListComfortable;
    private String numComfortable;
    private String reviewPoint;
    private String numReview;
    private List<ShowRoomDetailResponse> rooms;


}
