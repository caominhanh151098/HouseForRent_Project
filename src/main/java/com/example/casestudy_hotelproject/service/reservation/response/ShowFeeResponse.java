package com.example.casestudy_hotelproject.service.reservation.response;

import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ShowFeeResponse {
    private String name;
    private BookingFeeType feeType;
}
