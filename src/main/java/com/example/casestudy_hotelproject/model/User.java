package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.Role;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String firstName;
    @Column(nullable = false)
    private String lastName;
    private String avatar;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String phone;
    private int idCard;
    private Date dob;
    @Enumerated(EnumType.STRING)
    private Role role;

    private boolean status;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Set<House> hotels;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Set<EmergencyContact> emergencyContacts;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Set<Favorite> favorites;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Set<Review> reviews;

    @OneToMany(mappedBy = "user")
    @JsonIgnore
    private Set<Reservation> reservations;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "address_Id")
    private AddressUser addressUser;
}
