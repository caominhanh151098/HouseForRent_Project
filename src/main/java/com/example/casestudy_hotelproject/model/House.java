package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class House {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String hotelName;
    @Column(columnDefinition = "LONGTEXT")
    private String description;
    private BigDecimal price;
    private int quantityOfBeds;
    private int quantityOfRooms;
    private int quantityOfBathrooms;
    @ManyToOne
    @JoinColumn(name = "user_Id")
    private User user;
    @OneToMany(mappedBy = "house")
    private Set<CategoryDetail> CategoryDetails;

    @OneToMany(mappedBy = "house")
    private Set<Room> rooms;

    @OneToMany(mappedBy = "house")
    private Set<ComfortableDetail> comfortableDetails;

    @OneToMany(mappedBy = "house")
    private Set<Image> images;

    @OneToMany(mappedBy = "house")
    private Set<Location> locations;

    @OneToMany(mappedBy = "house")
    private Set<Favorite> favorites;

    @OneToMany(mappedBy = "house")
    private Set<Review> reviews;

    @OneToMany(mappedBy = "house")
    private Set<Reservation> reservations;

    @OneToOne(mappedBy = "house")
    private ExtraRequest extraRequest;

}
