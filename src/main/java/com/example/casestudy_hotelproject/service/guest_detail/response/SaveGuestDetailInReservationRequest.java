package com.example.casestudy_hotelproject.service.guest_detail.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SaveGuestDetailInReservationRequest {
    private String numAdults;
    private String numChildrenAbove2;
    private String numBabies;
    private String numPets;
}
