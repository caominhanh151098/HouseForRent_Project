package com.example.casestudy_hotelproject.service.house.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowInfoHouseOfHostResponse {
    private String id;
    private String image;
    private String hotelName;
    private String categoryHotel;
    private Double avgReviewPoint;
}
