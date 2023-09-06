package com.example.casestudy_hotelproject.service.location.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowLocationListHouseResponse {
    private String address;
    private String longitude;
    private String latitude;
}
