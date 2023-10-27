package com.example.casestudy_hotelproject.service.reservation.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ReservationTest {
    private String id;
    private String status;
    private String completeDate;
    private String totalPrice;
}

