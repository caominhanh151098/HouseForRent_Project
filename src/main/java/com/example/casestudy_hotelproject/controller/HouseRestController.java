package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.HouseOfHostReponse;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/house")
@CrossOrigin(origins = "http://localhost:3000")
public class HouseRestController {
    private final HouseService houseService;

    @GetMapping
    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        return houseService.showDisplayHome(pageable);
    }
    @PostMapping
    public  void createHouse(@RequestBody House house) {
        houseService.createHouse(house);
    }
    @GetMapping("houseOfHost")
    public List<HouseOfHostReponse> getHouseOfHost(){
        List<HouseOfHostReponse> list=houseService.showHouseOfHost(2);
        return list;
    }
    @GetMapping("/detail/{id}")
    public ShowHouseDetailResponse showDetail(@PathVariable int id) {
        ShowHouseDetailResponse houseResp = houseService.showDetail(id);
        return houseResp;
    }

    @GetMapping("/detail/comfortable/{id}")
    public void showListComfortable(@PathVariable int id) {

    }
}
