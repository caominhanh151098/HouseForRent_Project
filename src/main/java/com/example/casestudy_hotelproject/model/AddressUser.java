package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class AddressUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String country;
    private String streetAddress;
    private String city;
    private String state;
    private int zipcode;

    @Override
    public String toString() {
        return "";
    }
}
