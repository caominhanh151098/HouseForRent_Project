package com.example.casestudy_hotelproject.service.category_hotel;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import com.example.casestudy_hotelproject.model.enums.TypeRoom;
import com.example.casestudy_hotelproject.repository.CategoryHouseRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CategoryHotelService {
    private final CategoryHouseRepository categoryHouseRepository;

    public CategoryHotel findById(int id){
       return categoryHouseRepository.findById(id);
    }
    public void saveCategory(CategoryHotel categoryHotel){
        categoryHouseRepository.save(categoryHotel);
    }
    public void editTypeRoomAndCategory(int  category , TypeRoom typeRoom){

    }
}
