package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.category_hotel.ConvenientService;
import com.example.casestudy_hotelproject.service.category_hotel.response.ListConvenientResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/category_hotel")
@CrossOrigin(origins = "http://localhost:3000")
public class CategoryHotelRestController {
    public final ConvenientService categoryHotelService;
    @GetMapping
    public List<ListConvenientResponse> getListCategory() {
        return  categoryHotelService.getListCategory();
    }
}
