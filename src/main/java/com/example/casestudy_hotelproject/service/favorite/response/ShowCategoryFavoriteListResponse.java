package com.example.casestudy_hotelproject.service.favorite.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class ShowCategoryFavoriteListResponse {
    private int id;
    private String name;
    private List<String> images;
    private int quantityHouse;
}
