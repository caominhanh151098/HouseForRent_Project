package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class CancellationPolicy {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int beforeCheckInDate_Default;
    private int afterBookingDate;
    private int beforeCheckInDate_High;
    private int refundPercentage_High;
    private int beforeCheckInDate_Low;
    private int refundPercentage_Low;

    @OneToMany(mappedBy = "cancellationPolicy")
    private List<CancellationPolicyList> cancellationPolicyLists;

    @Override
    public String toString() {
        return "";
    }
}
