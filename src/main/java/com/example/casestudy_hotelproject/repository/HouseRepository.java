package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseRepository extends JpaRepository<House, Integer> {
    Page<House> findAll(Pageable pageable);


    House findById(int id);
    List<House> findByUser_Id(int user_id);
}
