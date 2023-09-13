package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.RuleHouse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RuleHouseRepository extends JpaRepository<RuleHouse, Integer> {
    List<RuleHouse> findAllByHouse_Id(int houseId);
}
