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
public class DataSocketResponse {
    private String id;
    private String totalPrice;
    private List<BookingFeeResponse> bookingFees = new ArrayList<>();
    private HouseResponse house;
    private UserResponse user;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    private static class BookingFeeResponse{
        private String type;
        private String value;
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    private static class HouseResponse {
        private String id;
        private String hotelName;
    }
}
