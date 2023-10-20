package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.TypeRefundCancel;
import com.example.casestudy_hotelproject.model.enums.TypeCancellationPolicy;
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
public class CancellationPolicyList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    @Column(columnDefinition = "LONGTEXT")
    private String description;
    @Enumerated(EnumType.STRING)
    private TypeCancellationPolicy type;
    private boolean noRefunds;
    @Enumerated(EnumType.STRING)
    private TypeRefundCancel typeRefundCancel;

    @ManyToOne
    @JoinColumn(name = "cancellation_Policy_Id")
    private CancellationPolicy cancellationPolicy;

    @Override
    public String toString() {
        return "";
    }
}
