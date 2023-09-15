package com.example.casestudy_hotelproject.controller.admin;

import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseForAdminResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/admin/houses")
@CrossOrigin(origins = "http://localhost:3000")
public class AdminHouseRestController {

    private final HouseService houseService;
    @GetMapping
    Page<ShowListHouseForAdminResponse> showAll(Pageable pageable){
        return houseService.showListHouseForAdmin(pageable);
    }
}
