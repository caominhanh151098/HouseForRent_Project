package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/house")
public class HouseRestController {
    private final HouseService houseService;

    @GetMapping
    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        return houseService.showDisplayHome(pageable);
    }
}
