package com.example.casestudy_hotelproject.service.reservation.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowTableProfitsForAdmin {
    private String id;
    private String reservationDate;
    private String totalPrice;
    private List<ShowBookingFeeAdminResponse> bookingFees;
    private ShowHouseProfitsForAdmin house;
    private ShowUserProfitsForAdmin user;


    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class ShowBookingFeeAdminResponse {
        private String value;
        private String type;
    }
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class ShowHouseProfitsForAdmin {
        private String id;
        private String hotelName;
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class ShowUserProfitsForAdmin {
        private String id;
        private String firstName;
        private String avatar;
        private String email;
        private String phone;
    }
}
