package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.StatusHouse;
import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

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
    @Column(nullable = false)
    private BigDecimal price;
    private BigDecimal weekendPrice;
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
    private LocalDate createDate;
    @Column(name = "confirm_PDF")
    private String confirmPDF;

    @OneToOne(cascade =CascadeType.ALL)
    @JsonIgnore
    @JoinColumn(name = "description_Id")
    private Description description;

    @ManyToOne
    @JoinColumn(name = "user_Id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "category_Id")
    private CategoryHotel categoryHotel;
    @OneToMany(mappedBy = "house",cascade =CascadeType.ALL)
    private List<Room> rooms;

    @OneToMany(mappedBy = "house")
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
    private List<Favorite> favorites;

    @OneToMany(mappedBy = "house")
    private List<Reservation> reservations;

    @OneToMany(mappedBy = "house")
    private List<Review> reviews;

    @OneToOne
    @JoinColumn(name = "review_Point_Id")
    private ReviewPointHouse reviewPointHouse;

    @OneToMany(mappedBy = "house")
    private List<RuleHouse> ruleList;

    @OneToOne
    @JoinColumn(name = "ex_request_Id")
    private ExtraRequest extraRequest;

    @OneToMany(mappedBy = "house")
    private List<FeeHouse> feeHouses;

    public House(int id) {
        this.id = id;
    }

    @OneToMany(mappedBy = "house")
    private List<BlockingDate> blockingDates;

    @OneToMany(mappedBy = "house")
    private List<CancellationPolicyDetail> cancellationPolicyDetailList;

    @Override
    public String toString() {
        return "";
    }
}
