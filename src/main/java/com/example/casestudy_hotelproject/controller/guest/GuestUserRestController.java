package com.example.casestudy_hotelproject.controller.guest;

import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowReviewHostDetailResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.response.ShowUserDetailResponse;
import com.example.casestudy_hotelproject.service.user.response.UserInfoResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@AllArgsConstructor
@RequestMapping("/api/guest/user")
@CrossOrigin(origins = "http://localhost:3000")
public class GuestUserRestController {
    private final UserService userService;
    private final ReviewService reviewService;
    @GetMapping("/detail/{id}")
    public ShowUserDetailResponse getUser(@PathVariable int id, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 5) Pageable pageable) {
        return userService.getUserDetail(id, pageable);
    }

    @GetMapping("/detail/review/by-guest/{userId}")
    public Page<ShowReviewHostDetailResponse> getReviewDetailByGuest(@PathVariable int userId, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByGuest(userId, pageable);
    }

    @GetMapping("/detail/review/by-other-host/{userId}")
    public Page<ContentReviewResponse> getReviewDetailByOtherHost(@PathVariable int userId, @SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 10) Pageable pageable) {
        return reviewService.getReviewDetailByOtherHost(userId, pageable);
    }

    @PostMapping("/add-phone")
    public ResponseEntity<?> addPhoneUser(@RequestBody String phone) {
        userService.addPhoneNumber(phone);

        return ResponseEntity.ok(true);
    }

    @GetMapping("/get-info")
    public UserInfoResponse getInfoUser(){
        return userService.getInfoUser();
    }

    @PatchMapping("/update-info")
    public ResponseEntity<UserInfoResponse> updateUserInfo(@RequestBody Map<String, Object> updates){
        UserInfoResponse userInfoResponse = userService.updateUserInfo(updates);
        return ResponseEntity.ok(userInfoResponse);
    }
}
