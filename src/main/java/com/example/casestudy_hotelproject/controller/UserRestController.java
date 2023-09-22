package com.example.casestudy_hotelproject.controller;

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
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/client/detail/review/{id}/1")
    public Page<ShowReviewHostDetailResponse> getReviewDetailByGuest(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByGuest(id, pageable);
    }

    @GetMapping("/client/detail/review/{id}/2")
    public Page<ContentReviewResponse> getReviewDetailByOtherHost(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByOtherHost(id, pageable);
    }

    @PostMapping("/client/add-phone/{id}")
    public void addPhoneUser(@PathVariable int id, @RequestHeader(name = "Authorization") String token) {
        userService.addPhoneNumber(id, token);
    }

    @PostMapping("/client/login")
    public void loginOrRegister(@RequestHeader(name = "Authorization") String token) {
        userService.loginOrRegister(token);
    }
}
