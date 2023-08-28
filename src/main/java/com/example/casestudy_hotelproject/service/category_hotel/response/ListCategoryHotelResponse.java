package com.example.casestudy_hotelproject.service.category_hotel.response;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ListCategoryHotelResponse {
    private String id;
    private String name;
    private String iconUrl;
}
