package com.example.casestudy_hotelproject.service.Reservation.request;

import com.example.casestudy_hotelproject.service.guest_detail.response.SaveGuestDetailInReservationRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SaveReservationRequest {
    private String checkInDate;
    private String checkOutDate;
    private SaveGuestDetailInReservationRequest guestDetail;
    private String userId;
    private String houseId;
}
