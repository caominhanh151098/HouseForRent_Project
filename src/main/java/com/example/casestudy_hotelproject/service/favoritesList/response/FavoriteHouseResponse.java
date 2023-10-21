package com.example.casestudy_hotelproject.service.favoritesList.response;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Location;
import com.example.casestudy_hotelproject.model.enums.StatusHouse;
import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class FavoriteHouseResponse {
    private String hotelName;
    private BigDecimal price;
    private BigDecimal weekendPrice;
    private int quantityOfGuests;
    private int quantityOfBeds;
    private int quantityOfRooms;
    private int quantityOfBathrooms;
    private boolean bookNow;
    private Double avgReviewPoint;
    @Enumerated(EnumType.STRING)
    private TypeRoom typeRoom;
    @Enumerated(EnumType.STRING)
    private StatusHouse status;
    private LocalDate createDate;
    @Column(name = "confirm_PDF")
    private String confirmPDF;
    private Location location;
}
