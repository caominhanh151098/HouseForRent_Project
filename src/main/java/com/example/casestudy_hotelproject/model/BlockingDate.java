package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class BlockingDate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private LocalDate blockingDate;

    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;

    @Override
    public String toString() {
        return "";
    }
}
