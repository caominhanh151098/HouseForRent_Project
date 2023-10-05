package com.example.casestudy_hotelproject.service.dataSocket.response;

import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class DataSocketResponse {
    private String id;
    private String totalPrice;
    private BookingFeeResponse bookingFees;
    private HouseResponse house;
    private UserResponse user;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @ToString
    private static class BookingFeeResponse{
        private String type;
        private String value;
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @ToString
    private static class HouseResponse {
        private String id;
        private String hotelName;
    }
}
