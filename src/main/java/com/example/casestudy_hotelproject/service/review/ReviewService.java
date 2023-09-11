package com.example.casestudy_hotelproject.service.review;

import com.example.casestudy_hotelproject.model.Review;
import com.example.casestudy_hotelproject.repository.ReviewRepository;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public Page<ContentReviewResponse> showReviews(int houseId, Pageable pageable) {
        Page<Review> reviews = reviewRepository.findAllByHouse_Id(houseId, pageable);

        Page<ContentReviewResponse> reviewResp = reviews.map(r -> AppUtils.mapper.map(r, ContentReviewResponse.class));
        return reviewResp;
    }
}
