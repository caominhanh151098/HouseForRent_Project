package com.example.casestudy_hotelproject.controller.client;

import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowDetailListComfortableResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowMiniReviewResponse;
import com.example.casestudy_hotelproject.service.rule.RuleService;
import com.example.casestudy_hotelproject.service.rule.response.ShowRuleDetailResponse;
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
@RequestMapping("/api/client/house")
public class ClientHouseRestController {
    private final HouseService houseService;
    private final ComfortableService comfortableService;
    private final ReviewService reviewService;
    private final RuleService ruleService;

    @GetMapping
    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        return houseService.showDisplayHome(pageable);
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

    @GetMapping("/detail/rule/{id}")
    public List<ShowRuleDetailResponse> getRule(@PathVariable int id) {
        return ruleService.showRuleByHouse(id);
    }

    @GetMapping("/detail/safety/{id}")
    public List<ShowMiniListComfortableResponse> getSafety(@PathVariable int id) {
        return houseService.showSafetyAndAccommodation(id);
    }
}
