package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.TypeHouse;
import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;
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
    private int quantityOfGuests;
    private int quantityOfBeds;
    private int quantityOfRooms;
    private int quantityOfBathrooms;
    private Double avgReviewPoint;
    @Enumerated(EnumType.STRING)
    private TypeHouse typeHouse;
    @Enumerated(EnumType.STRING)
    private TypeRoom typeRoom;

    @ManyToOne
    @JoinColumn(name = "user_Id")
    private User user;
    @OneToMany(mappedBy = "house",cascade =CascadeType.ALL)
    private Set<CategoryDetail> CategoryDetails;

    @OneToMany(mappedBy = "house")
    private Set<Room> rooms;

    @OneToMany(mappedBy = "house",cascade =CascadeType.ALL)
    private Set<ComfortableDetail> comfortableDetails;

    @OneToMany(mappedBy = "house",cascade =CascadeType.ALL)
    private List<Image> images;

    @OneToOne
    @JoinColumn(name = "location_Id")
    private Location location;

    @OneToMany(mappedBy = "house")
    private Set<Favorite> favorites;

    @OneToMany(mappedBy = "house")
    private List<Review> reviews;

    @OneToMany(mappedBy = "house")
    private Set<Reservation> reservations;

    @OneToOne
    @JoinColumn(name = "ex_Request_Id")
    private ExtraRequest extraRequest;

}
