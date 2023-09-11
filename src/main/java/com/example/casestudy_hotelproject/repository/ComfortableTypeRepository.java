package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.ComfortableType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComfortableTypeRepository extends JpaRepository<ComfortableType, Integer> {
    List<ComfortableType> findAll();
}
