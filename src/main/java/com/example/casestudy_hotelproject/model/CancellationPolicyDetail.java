package com.example.casestudy_hotelproject.model;

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
public class CancellationPolicyDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;
    @ManyToOne
    @JoinColumn(name = "cancellation_Policy_List_Id")
    private CancellationPolicyList cancellationPolicyList;
}
