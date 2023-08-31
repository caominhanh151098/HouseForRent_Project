package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    List<Review> findAllByHouse_Id(int house_Id);
}
