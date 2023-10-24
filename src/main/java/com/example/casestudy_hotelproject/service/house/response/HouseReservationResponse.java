package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import com.example.casestudy_hotelproject.service.image.response.ImageRespone;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class HouseReservationResponse {
    private  int id;
    private String hotelName;
    private List<ImageRespone> images = new ArrayList<>();
    private String price;
    private TypeRoom typeRoom;
}
