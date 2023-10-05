package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Fee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeeRepository extends JpaRepository<Fee, Integer> {
    List<Fee> findAll();
}
