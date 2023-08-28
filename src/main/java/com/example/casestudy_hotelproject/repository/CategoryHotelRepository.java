package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryHotelRepository extends JpaRepository<CategoryHotel, Integer> {
    List<CategoryHotel> findAll();
}
