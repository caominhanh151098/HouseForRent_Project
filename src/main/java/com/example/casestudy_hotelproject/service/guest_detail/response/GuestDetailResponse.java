package com.example.casestudy_hotelproject.service.guest_detail.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class GuestDetailResponse {
    private int numAdults;
    private  int numChildrenAbove2;
    private int numBabies;
    private int numPets;
}
