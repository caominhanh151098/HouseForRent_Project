package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.favorite.FavoriteService;
import com.example.casestudy_hotelproject.service.favorite.response.ShowCategoryFavoriteListResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowReviewHostDetailResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.response.ShowUserDetailResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/user")
@CrossOrigin(origins = "http://localhost:3000")
public class UserRestController {
    private final UserService userService;
    private final ReviewService reviewService;

    @GetMapping("/client/detail/{id}")
    public ShowUserDetailResponse getUser(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 5) Pageable pageable) {
        return userService.getUserDetail(id, pageable);
    }

    @GetMapping("/client/detail/review/by-guest/{userId}")
    public Page<ShowReviewHostDetailResponse> getReviewDetailByGuest(@PathVariable int userId, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByGuest(userId, pageable);
    }

    @GetMapping("/client/detail/review/by-other-host/{userId}")
    public Page<ContentReviewResponse> getReviewDetailByOtherHost(@PathVariable int userId, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByOtherHost(userId, pageable);
    }

    @PostMapping("/client/add-phone")
    public ResponseEntity<?> addPhoneUser(@RequestBody String phone) {
        userService.addPhoneNumber(phone);

        return ResponseEntity.ok(true);
    }


}
