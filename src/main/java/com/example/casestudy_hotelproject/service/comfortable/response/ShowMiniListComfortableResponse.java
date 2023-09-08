package com.example.casestudy_hotelproject.service.comfortable.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowMiniListComfortableResponse {
    private String icon;
    private String name;
    private boolean static_comfortable = true;
}
