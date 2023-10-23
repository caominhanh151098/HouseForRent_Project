package com.example.casestudy_hotelproject.service.house.response;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import com.example.casestudy_hotelproject.service.category_hotel.response.CategoryHotelRespone;
import com.example.casestudy_hotelproject.service.comfortable.response.ComfortableDetailRespone;
import com.example.casestudy_hotelproject.service.comfortable.response.ComfortableRespone;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.description.response.DescriptionRepone;
import com.example.casestudy_hotelproject.service.image.response.ImageRespone;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.location.response.ShowLocationListHouseResponse;
import com.example.casestudy_hotelproject.service.room.RoomRespone;
import com.example.casestudy_hotelproject.service.room.ShowRoomDetailResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class HouseOfHostReponse {
    private String id;
    private ShowLocationListHouseResponse location;
    private String hotelName;
    private String quantityOfGuests;
    private String quantityOfRooms;
    private String quantityOfBeds;
    private String quantityOfBathrooms;
    private DescriptionRepone description;
    private String typeRoom;
    private CategoryHotelRespone categoryHotel;
    private String bookNow;
    private String status;
    private List<ImageRespone> images = new ArrayList<>();
    private List<ComfortableDetailRespone> comfortableDetails;
    private List<RoomRespone> rooms;
}
