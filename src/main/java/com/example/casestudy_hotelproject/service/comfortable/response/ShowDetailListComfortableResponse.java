package com.example.casestudy_hotelproject.service.comfortable.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowDetailListComfortableResponse {
    private String nameComfortableType;
    private List<ShowComfortableDetailResponse> comfortableDetailList = new ArrayList<>();
}
