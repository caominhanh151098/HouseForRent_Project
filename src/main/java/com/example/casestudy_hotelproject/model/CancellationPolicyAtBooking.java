package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.TypeRefundLongTerm;
import com.example.casestudy_hotelproject.model.enums.TypeRefundShortTerm;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Table(name = "cancellation_policy_booking")
public class CancellationPolicyAtBooking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private TypeRefundShortTerm shortTerm;
    private TypeRefundLongTerm longTerm;

    @Override
    public String toString() {
        return "";
    }
}
