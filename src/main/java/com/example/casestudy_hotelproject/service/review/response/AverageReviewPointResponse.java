package com.example.casestudy_hotelproject.service.review.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AverageReviewPointResponse {
    private String cleanlinessPoint;
    private String communicationPoint;
    private String checkInPoint;
    private String accuracyPoint;
    private String locationPoint;
    private String valuePoint;
    private String avgPoint;
}
