package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.ComfortableType;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.repository.ComfortableDetailRepository;
import com.example.casestudy_hotelproject.repository.ComfortableRepository;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowListFilterResponse;
import com.example.casestudy_hotelproject.service.comfortableType.ComfortableTypeService;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@AllArgsConstructor
@Data
@RequestMapping("/api/comfortable")
@CrossOrigin(origins = "http://localhost:3000")
public class ComfortableRestController {
    private final ComfortableService comfortableService;
    private final ComfortableDetailRepository comfortableDetailRepository;
    private final HouseRepository houseRepository;

    @GetMapping
    public List<Comfortable> findAll() {
        return comfortableService.getComfortable();
    }
    @GetMapping("/list-filter")
    public List<ShowListFilterResponse> showListFilter() {
        return comfortableService.getListFilter();
    }

    @GetMapping("/getComfortableType")
    public List<ComfortableType> getComfortableType(){
        return comfortableService.getComfortableType();
    }
    @GetMapping("/{comfortableId}")
    public List<ShowHouseDetailResponse> getHousesByComfortable(@PathVariable int comfortableId) {
        List<House> houses = houseRepository.findHousesByComfortableId(comfortableId);
        return houses.stream().map(e -> AppUtils.mapper.map(e, ShowHouseDetailResponse.class)).collect(Collectors.toList());
    }

}
