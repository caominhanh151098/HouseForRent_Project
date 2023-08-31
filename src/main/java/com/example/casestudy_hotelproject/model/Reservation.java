package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

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
    private LocalDate reservationDate;

    @OneToOne
    @JoinColumn(name = "guest_Detail_Id")
    private GuestDetail guestDetail;

    @OneToOne
    @JoinColumn(name = "payment_Id")
    private Payment payment;
}
