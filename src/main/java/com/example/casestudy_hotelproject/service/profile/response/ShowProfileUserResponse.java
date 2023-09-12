package com.example.casestudy_hotelproject.service.profile.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowProfileUserResponse {
    private String pet;
    private String work;
    private String accommodation;
    private String aboutMe;
}
