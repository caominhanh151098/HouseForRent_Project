package com.example.casestudy_hotelproject.service.reservation.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationTestRequest {
    private String id;
    private String status;

    private String completeDate;
    private String totalPrice;
}
