package com.example.casestudy_hotelproject.service.category_hotel.request;

import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TypeRoomAndCategoryRequest {
    private TypeRoom typeRoom;
    private String categoryHotel;
}
