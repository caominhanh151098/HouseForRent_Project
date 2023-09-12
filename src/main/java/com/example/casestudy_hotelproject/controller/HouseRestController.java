package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowDetailListComfortableResponse;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.HouseOfHostReponse;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowMiniReviewResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/house")
@CrossOrigin(origins = "http://localhost:3000")
public class HouseRestController {
    private final HouseService houseService;
    private final ComfortableService comfortableService;
    private final ReviewService reviewService;

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
    public List<ShowDetailListComfortableResponse> showListComfortable(@PathVariable int id) {
        List<ShowDetailListComfortableResponse> listComfortableResp = comfortableService.showListComfortableByHouseId(id);
        return listComfortableResp;
    }

    @GetMapping("/detail/review/{id}")
    public ShowMiniReviewResponse showMiniReview(@PathVariable int id) {
        return houseService.showMiniReview(id);
    }

    @GetMapping("/detail/reviews/{id}")
    public Page<ContentReviewResponse> showReviews(@PathVariable int id,@SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 12) Pageable pageable) {
        return reviewService.showReviews(id, pageable);
    }
}
