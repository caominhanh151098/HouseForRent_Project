package com.example.casestudy_hotelproject.service.reservation.response;

import com.example.casestudy_hotelproject.model.GuestDetail;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.HouseReservationResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowUserReservationResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowListReservationResponse {
    private int id;
    private HouseReservationResponse house;
    private ShowUserReservationResponse user;
    private GuestDetailResponse guestDetail;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private StatusReservation status;
    private BigDecimal totalPrice;
}
