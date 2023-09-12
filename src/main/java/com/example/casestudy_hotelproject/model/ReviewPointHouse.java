package com.example.casestudy_hotelproject.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewPointHouse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private double cleanlinessPoint;
    private double communicationPoint;
    private double checkInPoint;
    private double accuracyPoint;
    private double locationPoint;
    private double valuePoint;
    private double avgPoint;

    @Override
    public String toString() {
        return "";
    }
}
