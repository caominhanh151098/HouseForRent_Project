package com.example.casestudy_hotelproject.service.house.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PriceResponse {
    private int price;
    private int weekendPrice;
}
