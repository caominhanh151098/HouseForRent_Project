package com.example.casestudy_hotelproject.service.user.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowUserReservationResponse {
    private String lastName;
    private String firstName;
    private String phone;
}
