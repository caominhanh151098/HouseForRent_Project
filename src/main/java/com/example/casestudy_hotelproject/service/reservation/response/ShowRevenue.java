package com.example.casestudy_hotelproject.service.reservation.response;

import com.example.casestudy_hotelproject.model.enums.StatusReservation;
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
public class ShowRevenue {
    private String id;
    private HouseReservationResponse house;
    private ShowUserReservationResponse user;

    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private LocalDate completeDate;
    private StatusReservation status;
    private BigDecimal totalPrice;
}
