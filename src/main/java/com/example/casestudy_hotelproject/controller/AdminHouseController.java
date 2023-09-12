package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseForAdminResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("/api/admin/houses")
@CrossOrigin(origins = "http://localhost:3000")
public class AdminHouseController {
    private final HouseService houseService;

    @GetMapping
    Page<ShowListHouseForAdminResponse> showAll(Pageable pageable){
        return houseService.showListHouseForAdmin(pageable);
    }
}
