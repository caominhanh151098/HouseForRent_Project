package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.ComfortableDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComfortableDetailRepository extends JpaRepository<ComfortableDetail, Integer> {
    ComfortableDetail findByHouseIdAndComfortableId(int house_id, int comfortable_id);

    ComfortableDetail findByComfortable_IdAndHouse_Id(int comfortableId, int houseId);

    List<ComfortableDetail> findAllByHouse_Id(int house_id);
}
