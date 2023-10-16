package com.example.casestudy_hotelproject.service.user.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRequest {

    private String id;
    private String firstName;
    private String lastName;
    private String avatar;
    private String email;
    private String status;
}
