package com.example.casestudy_hotelproject.service.review.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AverageReviewPointResponse {
    private double cleanlinessPoint;
    private double communicationPoint;
    private double checkInPoint;
    private double accuracyPoint;
    private double locationPoint;
    private double valuePoint;
    private double avgPoint;
}
