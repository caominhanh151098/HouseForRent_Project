package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
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
    private String location;
    private String hotelName;
    private String quantityOfBeds;
    private String price;
    private String review;
    private List<ShowImgListResponse> images = new ArrayList<>();
}
