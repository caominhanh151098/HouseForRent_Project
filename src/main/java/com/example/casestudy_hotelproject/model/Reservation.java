package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;
    @ManyToOne
    @JoinColumn(name = "user_Id")
    private User user;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private LocalDate reservationDate = LocalDate.now();
    private BigDecimal price;
    private BigDecimal weekendPrice;
    private BigDecimal totalPrice;
    @Enumerated(EnumType.STRING)
    private StatusReservation status;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "guest_Detail_Id")
    private GuestDetail guestDetail;

    @OneToMany(mappedBy = "reservation", cascade = CascadeType.ALL)
    private List<BookingFee> bookingFees;

    @OneToOne
    @JoinColumn(name = "payment_Id")
    private Payment payment;

    @Override
    public String toString() {
        return "";
    }
}
