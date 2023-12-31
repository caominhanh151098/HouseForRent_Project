package com.example.casestudy_hotelproject.service.reservation.request;

import com.example.casestudy_hotelproject.service.guest_detail.response.SaveGuestDetailInReservationRequest;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class SaveReservationRequest {
    private String checkInDate;
    private String checkOutDate;
    private SaveGuestDetailInReservationRequest guestDetail;
    private String houseId;
}
