package com.example.casestudy_hotelproject.service.reservation.response;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.service.house.response.HouseReservationResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ReservationHistoryResponse {
    private String id;
    private HouseReservationResponse house;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    private BigDecimal totalPrice;
    private StatusReservation status;
}
