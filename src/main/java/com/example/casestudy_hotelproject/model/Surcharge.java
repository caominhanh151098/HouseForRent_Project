package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.model.enums.SurchargeType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Surcharge {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private double percent;
    @Enumerated(EnumType.STRING)
    private SurchargeType type;

    @Override
    public String toString() {
        return "";
    }
}
