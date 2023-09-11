package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import com.example.casestudy_hotelproject.model.ComfortableType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<CategoryHotel, Integer> {
}
