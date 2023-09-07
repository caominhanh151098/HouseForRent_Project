package com.example.casestudy_hotelproject.service.review.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowMiniReviewResponse {
    private AverageReviewPointResponse reviewPointHouse;
    private List<ContentReviewResponse> reviews = new ArrayList<>();
}
