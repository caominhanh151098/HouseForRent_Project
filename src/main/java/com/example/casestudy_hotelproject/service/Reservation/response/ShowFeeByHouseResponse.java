package com.example.casestudy_hotelproject.service.Reservation.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowFeeByHouseResponse {
    private ShowFeeResponse fee;
    private BigDecimal price;
    private int other = 1;

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    static class ShowFeeResponse {
        private String name;
        private String feeType;
    }
}
