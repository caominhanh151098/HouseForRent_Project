package com.example.casestudy_hotelproject.service.reservation.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ReversationBlockResponse {
    private int id;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
}
