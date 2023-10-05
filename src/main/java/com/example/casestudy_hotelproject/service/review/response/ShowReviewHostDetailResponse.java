package com.example.casestudy_hotelproject.service.review.response;

import com.example.casestudy_hotelproject.service.house.response.ShowHouseInfoInReviewResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowReviewHostDetailResponse {
    private ShowHouseInfoInReviewResponse house;
    private ContentReviewResponse review;

}
