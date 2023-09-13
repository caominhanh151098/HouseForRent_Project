package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.ComfortableDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ComfortableDetailRepository extends JpaRepository<ComfortableDetail, Integer> {
    boolean existsComfortableDetailByComfortable_IdAndHouse_Id(int comfortableId, int houseId);

    ComfortableDetail findByComfortable_IdAndHouse_Id(int comfortableId, int houseId);
}
