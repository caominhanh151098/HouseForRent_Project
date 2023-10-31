package com.example.casestudy_hotelproject.service.house.response;

import java.time.LocalDate;

public interface HouseDetailResponse {
    String getId();

    Double getAvg_Review_Point();

    String getBook_Now();

    Integer getCategory_Id();

    String getConfirm_Pdf();

    LocalDate getCreate_Date();

    Integer getDescription_Id();

    Integer getExRequest_Id();

    String getHotel_Name();

    Integer getLocation_Id();

    String getPrice();

    Integer getQuantity_Of_Bathrooms();

    Integer getQuantity_Of_Beds();

    Integer getQuantity_Of_Guests();

    Integer getQuantity_Of_Rooms();

    Integer getReview_Point_Id();

    String getStatus();

    String getType_Room();

    Integer getUser_Id();

    Double getWeekendPrice();

    String getAddress();

    String getLongitude();

    String getLatitude();

    String getImgs();
    String getCategory_House_Name();

    Integer getCount_Review();
}