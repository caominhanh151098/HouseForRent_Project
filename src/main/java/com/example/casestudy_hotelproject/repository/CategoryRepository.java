package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import com.example.casestudy_hotelproject.model.ComfortableType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<CategoryHotel, Integer> {
    List<CategoryHotel> findAll();
}
