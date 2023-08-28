package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.category_hotel.CategoryHotelService;
import com.example.casestudy_hotelproject.service.category_hotel.response.ListCategoryHotelResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/category_hotel")
public class CategoryHotelRestController {
    public final CategoryHotelService categoryHotelService;
    @GetMapping
    public List<ListCategoryHotelResponse> getListCategory() {
        return  categoryHotelService.getListCategory();
    }
}
