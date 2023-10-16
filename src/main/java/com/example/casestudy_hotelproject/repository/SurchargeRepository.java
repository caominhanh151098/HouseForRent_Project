package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Surcharge;
import com.example.casestudy_hotelproject.model.enums.SurchargeType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SurchargeRepository extends JpaRepository<Surcharge, Integer> {
    Surcharge findSurchargeByType(SurchargeType type);
}
