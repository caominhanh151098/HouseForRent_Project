package com.example.casestudy_hotelproject.controller.guest;

import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailService;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/guest/reservation")
@CrossOrigin(origins = "http://localhost:3000")
public class GuestReservationRestController {
    private final ReservationService reservationService;
    private final GuestDetailService guestDetailService;
    @PostMapping("/create")
    public void saveReservation(@RequestBody SaveReservationRequest request) {
        reservationService.saveNewReservation(request);
    }
}
