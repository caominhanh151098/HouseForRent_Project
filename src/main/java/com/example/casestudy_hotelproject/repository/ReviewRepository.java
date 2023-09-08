package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    Set<Review> getAllByHouse_Id(int houseId);
    Page<Review> findAllByHouse_Id(int houseId, Pageable pageable);

    int countAllByHouse_Id(int houseId);
}
