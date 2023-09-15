package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowReviewHostDetailResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.response.ShowUserDetailResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/user")
@CrossOrigin(origins = "http://localhost:3000")
public class UserRestController {
    private final UserService userService;
    private final ReviewService reviewService;

    @GetMapping("/admin")
    public Page<UserResponse> findAll(@RequestParam(defaultValue = "") String search, Pageable pageable) {
        return userService.findAll(search, pageable);
    }

    @GetMapping("/client/detail/{id}")
    public ShowUserDetailResponse getUser(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 5) Pageable pageable) {
        return userService.getUserDetail(id, pageable);
    }

    @GetMapping("/client/detail/review/{id}/1")
    public Page<ShowReviewHostDetailResponse> getReviewDetailByGuest(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByGuest(id, pageable);
    }

    @GetMapping("/client/detail/review/{id}/2")
    public Page<ContentReviewResponse> getReviewDetailByOtherHost(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByOtherHost(id, pageable);
    }

}
