package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewPoint {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int cleanlinessPoint;
    private int communicationPoint;
    private int checkInPoint;
    private int accuracyPoint;
    private int locationPoint;
    private int valuePoint;
    private double avgPoint;
}
