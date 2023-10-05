package com.example.casestudy_hotelproject.service.review.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ReviewPointResponse {
    private int id;
    private int cleanlinessPoint;
    private int communicationPoint;
    private int checkInPoint;
    private int accuracyPoint;
    private int locationPoint;
    private int valuePoint;
    private double avgPoint;
}
