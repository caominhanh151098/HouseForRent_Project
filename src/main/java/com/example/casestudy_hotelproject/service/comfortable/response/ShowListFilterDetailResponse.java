package com.example.casestudy_hotelproject.service.comfortable.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ShowListFilterDetailResponse {
    private int id;
    private String name;
}
