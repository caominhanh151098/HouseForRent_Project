package com.example.casestudy_hotelproject.service.review;

import com.example.casestudy_hotelproject.model.Review;
import com.example.casestudy_hotelproject.repository.ReviewRepository;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowReviewHostDetailResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowUserReviewResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public Page<ContentReviewResponse> showReviews(int houseId, Pageable pageable) {
        Page<Review> reviews = reviewRepository.findAllByHouse_Id(houseId, pageable);

        Page<ContentReviewResponse> reviewResp = reviews.map(r -> AppUtils.mapper.map(r, ContentReviewResponse.class));
        return reviewResp;
    }

    public Page<ShowReviewHostDetailResponse> getReviewDetailByGuest(int userId, Pageable pageable) {
        Page<Review> reviewPage = reviewRepository.getReviewUserByGuest(userId, pageable);

        Page<ShowReviewHostDetailResponse> reviewResp = reviewPage.map(r -> AppUtils.mapper.map(r, ShowReviewHostDetailResponse.class));
        for (int index = 0; index < reviewPage.getContent().size(); index++) {
            Review review = reviewPage.getContent().get(index);
            ContentReviewResponse content = AppUtils.mapper.map(review, ContentReviewResponse.class);
            ShowReviewHostDetailResponse reviewDetailResp = reviewResp.getContent().get(index);
            reviewDetailResp.setReview(content);
            reviewDetailResp.getHouse().setImage(review.getHouse().getImages().get(0).getSrcImg());
        }
        return reviewResp;
    }

    public Page<ContentReviewResponse> getReviewDetailByOtherHost(int userId, Pageable pageable) {
        Page<Review> reviewPage = reviewRepository.getReviewUserByHost(userId, pageable);

        Page<ContentReviewResponse> reviewResp =
                reviewPage.map(r -> AppUtils.mapper.map(r, ContentReviewResponse.class));
        for (int index = 0; index < reviewPage.getContent().size(); index++) {
            Review review = reviewPage.getContent().get(index);
            ShowUserReviewResponse user = AppUtils.mapper.map(review.getHouse().getUser(), ShowUserReviewResponse.class);
            reviewResp.getContent().get(index).setUser(user);
        }
        return reviewResp;
    }
}
