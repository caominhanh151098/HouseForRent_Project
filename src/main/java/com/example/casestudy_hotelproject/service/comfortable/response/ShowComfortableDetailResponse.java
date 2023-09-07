package com.example.casestudy_hotelproject.service.comfortable.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowComfortableDetailResponse {
        private String name;
        private String icon;
        private String status = "true";
        private String description;
}
