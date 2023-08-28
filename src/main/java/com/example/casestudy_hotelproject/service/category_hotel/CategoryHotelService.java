package com.example.casestudy_hotelproject.service.category_hotel;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import com.example.casestudy_hotelproject.repository.CategoryHotelRepository;
import com.example.casestudy_hotelproject.service.category_hotel.response.ListCategoryHotelResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CategoryHotelService {
    private final CategoryHotelRepository categoryHotelRepository;

    public List<ListCategoryHotelResponse> getListCategory() {
        return categoryHotelRepository.findAll()
                .stream()
                .map(e -> AppUtils.mapper.map(e, ListCategoryHotelResponse.class)).collect(Collectors.toList());
    }
}
