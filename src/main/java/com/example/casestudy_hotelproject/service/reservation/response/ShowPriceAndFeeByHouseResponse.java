package com.example.casestudy_hotelproject.service.reservation.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ShowPriceAndFeeByHouseResponse {
    private BigDecimal price;
    private BigDecimal weekendPrice;
    private List<ShowFeeByHouseResponse> feeHouses;
}
