package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.House;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HouseRepository extends JpaRepository<House, Integer> {
    Page<House> findAll(Pageable pageable);

    House findById(int id);
}
