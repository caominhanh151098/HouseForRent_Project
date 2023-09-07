package com.example.casestudy_hotelproject.service.description.response;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowDescriptionResponse {
    private String listingDescription;
    private String space;
    private String guestAccess;
    private String other;
    private String interaction;
}
