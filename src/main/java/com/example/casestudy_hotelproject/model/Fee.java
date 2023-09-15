package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.model.enums.FeeType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Fee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @Enumerated(EnumType.STRING)
    private FeeType type;

    @Enumerated(EnumType.STRING)
    private BookingFeeType feeType;

    @OneToMany(mappedBy = "fee")
    private List<FeeHouse> feeHouses;

    @Override
    public String toString() {
        return "";
    }
}
