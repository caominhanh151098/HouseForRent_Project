package com.example.casestudy_hotelproject.service.image.response;

import com.example.casestudy_hotelproject.service.room.RoomRespone;
import com.example.casestudy_hotelproject.service.room.SelectRoom;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ImageRespone {
    private String id;
    private String srcImg;
    private SelectRoom room;
}
