package com.example.casestudy_hotelproject.service.user.response;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserResponse {

    private String id;
    private String firstName;
    private String lastName;
    private String avatar;
    private String email;
    private String status;
}
