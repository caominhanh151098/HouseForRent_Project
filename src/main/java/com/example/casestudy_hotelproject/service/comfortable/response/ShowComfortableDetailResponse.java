package com.example.casestudy_hotelproject.service.comfortable.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowComfortableDetailResponse {
        private int id;
        private String name;
        private String icon;
        private boolean status = true;
        private String description;
}
