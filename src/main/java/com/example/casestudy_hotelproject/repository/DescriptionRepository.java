package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Description;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DescriptionRepository extends JpaRepository<Description, Integer> {
    Description findById(int id);
}
