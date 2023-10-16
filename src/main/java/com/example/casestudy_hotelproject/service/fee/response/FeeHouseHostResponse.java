package com.example.casestudy_hotelproject.service.fee.response;

import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class FeeHouseHostResponse {
    @Min(0)
    private String price;
    @Min(0)
    private String other;
    private FeeResponse fee;
}
