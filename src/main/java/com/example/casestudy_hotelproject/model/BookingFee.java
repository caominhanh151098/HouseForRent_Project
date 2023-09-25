package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookingFee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private BigDecimal value;
    private int other = 1;

    @Enumerated(EnumType.STRING)
    private BookingFeeType type;

    @ManyToOne
    @JoinColumn(name = "reservation_Id")
    private Reservation reservation;

    public BookingFee(BigDecimal value, int other, BookingFeeType type, Reservation reservation) {
        this.value = value;
        this.other = other;
        this.type = type;
        this.reservation = reservation;
    }

    @Override
    public String toString() {
        return "";
    }
}
