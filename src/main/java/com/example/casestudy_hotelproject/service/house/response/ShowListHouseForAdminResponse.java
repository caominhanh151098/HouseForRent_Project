package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowListHouseForAdminResponse {
    private String id;
    private String hotelName;
    private String description;
    private String price;
    private String quantityOfGuests;
    private String quantityOfBeds;
    private String quantityOfRooms;
    private String quantityOfBathrooms;
    private String typeRoom;
    private String status;
    private UserResponse user;
    private LocationResponseForAdmin location;
    private CategoryResponseForAdmin categoryHotel;


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
