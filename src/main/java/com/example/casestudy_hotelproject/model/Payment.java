package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.StatusPayment;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private LocalDate paymentDate;
    private BigDecimal Amount;
    private String paymentMethod;
    @Enumerated(EnumType.STRING)
    private StatusPayment status;

    @Override
    public String toString() {
        return "";
    }
}
