package com.example.casestudy_hotelproject.service.room;

import com.example.casestudy_hotelproject.service.bed.BedRespone;
import com.example.casestudy_hotelproject.service.image.response.ImageRespone;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RoomRespone {
    private String id;
    private List<ImageRespone> images;
    private List<BedRespone> beds;
}
