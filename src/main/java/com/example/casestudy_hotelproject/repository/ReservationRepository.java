package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

}
