package com.example.casestudy_hotelproject.service.house.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class HouseRequest {
    private String id;
    private String hotelName;
    private String price;
    private String quantityOfGuests;
    private String quantityOfBeds;
    private String quantityOfRooms;
    private String quantityOfBathrooms;
    private String bookNow;
    private String typeRoom;
    private String categoryHotel;
    private String descriptions;
    private String address;
    private List<String> imageList;
    private List<String> comfortableDetailList;
}
