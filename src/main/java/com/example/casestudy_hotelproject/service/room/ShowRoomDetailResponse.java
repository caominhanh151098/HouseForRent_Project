package com.example.casestudy_hotelproject.service.room;

import com.example.casestudy_hotelproject.service.ShowBedDetailResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowRoomDetailResponse {
    private String name;
    private String image;
    private String beds;
    private List<ShowBedDetailResponse> bedDetail = new ArrayList<>();
}
