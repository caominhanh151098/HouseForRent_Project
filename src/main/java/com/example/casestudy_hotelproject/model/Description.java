package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Description {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(columnDefinition = "LONGTEXT")
    private String listingDescription;
    @Column(columnDefinition = "LONGTEXT")
    private String space;
    @Column(columnDefinition = "LONGTEXT")
    private String guestAccess;
    @Column(columnDefinition = "LONGTEXT")
    private String other;
    @Column(columnDefinition = "LONGTEXT")
    private String interaction;
}
