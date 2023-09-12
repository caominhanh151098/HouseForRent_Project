package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.Role;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
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
    private Date dob;
    @Enumerated(EnumType.STRING)
    private Role role;
    private boolean status;
    private LocalDate createDay;

    @OneToMany(mappedBy = "user")
    private List<House> hotels;

    @OneToMany(mappedBy = "user")
    private List<EmergencyContact> emergencyContacts;

    @OneToMany(mappedBy = "user")
    private List<Favorite> favorites;

    @OneToMany(mappedBy = "user")
    private List<Review> reviews;

    @OneToMany(mappedBy = "user")
    private List<Reservation> reservations;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "address_Id")
    private AddressUser addressUser;

    @OneToOne
    @JoinColumn(name = "identity_Paper_Id")
    private IdentityPaper identity;

    @OneToMany(mappedBy = "user")
    private List<InterestDetail> interestDetails;

    @OneToOne
    @JoinColumn(name = "profile_Id")
    private Profile profile;


    @Override
    public String toString() {
        return "";
    }
}
