package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.comfortable.response.ShowComfortableDetailResponse;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.location.response.ShowLocationListHouseResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowListHouseResponse {
    private String id;
    private String title;
    private ShowLocationListHouseResponse location;
    private String hotelName;
    private int quantityOfBeds;
    private int quantityOfBathrooms;
    private String price;
    private String review;
    private List<ShowImgListResponse> images = new ArrayList<>();
    private List<ShowComfortableDetailResponse> comfortables = new ArrayList<>();
}
