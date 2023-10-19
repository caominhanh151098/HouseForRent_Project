package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.StatusPayment;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String txnRef;
    private BigDecimal amount;
    private String bankCode;
    private String transactionNo;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    @Enumerated(EnumType.STRING)
    private StatusPayment status;

    @Override
    public String toString() {
        return "";
    }
}
