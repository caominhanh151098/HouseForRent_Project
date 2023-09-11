package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.StatusHouse;
import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.HashSet;
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
    private boolean bookNow;
    private Double avgReviewPoint;
    @Enumerated(EnumType.STRING)
    private TypeRoom typeRoom;
    @Enumerated(EnumType.STRING)
    private StatusHouse status;

    @ManyToOne
    @JoinColumn(name = "user_Id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "category_Id")
    private CategoryHotel categoryHotel;

    @OneToMany(mappedBy = "house")
    @JsonIgnore
    private Set<Room> rooms = new HashSet<>();

    @OneToMany(mappedBy = "house",cascade =CascadeType.ALL)
    @JsonIgnore
    private List<ComfortableDetail> comfortableDetails;

    @OneToMany(mappedBy = "house",cascade =CascadeType.ALL)
    @JsonIgnore
    private List<Image> images;

    @OneToOne(cascade = CascadeType.ALL)
    @JsonIgnore
    @JoinColumn(name = "location_Id")
    private Location location;

    @OneToMany(mappedBy = "house")
    @JsonIgnore
    private Set<Favorite> favorites;

    @OneToMany(mappedBy = "house")
    @JsonIgnore
    private List<Review> reviews;

    @OneToMany(mappedBy = "house")
    @JsonIgnore
    private Set<Reservation> reservations;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "ex_Request_Id")
    private ExtraRequest extraRequest;

}
