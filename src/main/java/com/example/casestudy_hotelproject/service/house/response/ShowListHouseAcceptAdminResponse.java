package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShowListHouseAcceptAdminResponse {
    private String id;
    private String hotelName;
    private String confirmPDF;
    private String status;
    private UserResponse user;
}
