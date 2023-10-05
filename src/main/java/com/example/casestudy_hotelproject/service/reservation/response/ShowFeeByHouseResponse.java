package com.example.casestudy_hotelproject.service.reservation.response;

import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ShowFeeByHouseResponse {
    private ShowFeeResponse fee;
    private BigDecimal price;
    private int other = 1;
}
