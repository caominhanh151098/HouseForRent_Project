package com.example.casestudy_hotelproject.service.review.response;

import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.service.user.response.ShowUserReviewResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ContentReviewResponse {
    private String id;
    private ShowUserReviewResponse user;
    private String content;
    private LocalDate reviewDate;
    private ReviewPointResponse reviewPoint;
}
