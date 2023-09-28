package com.example.casestudy_hotelproject.service.comfortable.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ShowListFilterResponse {
    private String nameComfortableType;
    private List<ShowListFilterDetailResponse> comfortableDetailList;
}
