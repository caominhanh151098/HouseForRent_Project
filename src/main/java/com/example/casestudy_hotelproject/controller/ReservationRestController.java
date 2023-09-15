package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.Reservation.ReservationService;
import com.example.casestudy_hotelproject.service.Reservation.request.SaveReservationRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/reservation")
public class ReservationRestController {
    private final ReservationService reservationService;

    @PostMapping("/create")
    public void saveReservation(@RequestBody SaveReservationRequest request) {
        reservationService.saveNewReservation(request);
    }
}
