package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class FeeHouse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;

    @ManyToOne
    @JoinColumn(name = "fee_Id")
    private Fee fee;

    private BigDecimal price;
    private int other = 1;

    @Override
    public String toString() {
        return "";
    }
}