package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.description.response.ShowDescriptionResponse;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowListHouseForAdminResponse {
    private String id;
    private String hotelName;
    private String price;
    private String quantityOfGuests;
    private String quantityOfBeds;
    private String quantityOfRooms;
    private String quantityOfBathrooms;
    private String typeRoom;
    private String status;
    private UserResponse user;
    private ShowDescriptionResponse description;
    private LocationResponseForAdmin location;
    private CategoryResponseForAdmin categoryHotel;
    private List<ShowImgListResponse> images = new ArrayList<>();

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class LocationResponseForAdmin {
        private String id;
        private String address;
        private String latitude;
        private String longitude;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CategoryResponseForAdmin{
        private String id;
        private String name;
        private String iconUrl;
    }
}
