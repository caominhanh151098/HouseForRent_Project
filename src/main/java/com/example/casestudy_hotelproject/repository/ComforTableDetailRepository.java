package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.ComfortableDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComforTableDetailRepository extends JpaRepository<ComfortableDetail, Integer> {
}
