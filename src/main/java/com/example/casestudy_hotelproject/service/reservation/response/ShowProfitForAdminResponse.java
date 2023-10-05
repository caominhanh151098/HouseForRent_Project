package com.example.casestudy_hotelproject.service.reservation.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowProfitForAdminResponse {


    private String reservationDate;
    private String totalPrice;
    private List<ShowFeeForAdminRespone> bookingFees;


    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    private static class ShowFeeForAdminRespone {
        private String value;
        private String type;
    }

}
