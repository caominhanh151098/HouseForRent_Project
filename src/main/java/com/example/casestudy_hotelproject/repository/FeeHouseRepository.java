package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Fee;
import com.example.casestudy_hotelproject.model.FeeHouse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FeeHouseRepository extends JpaRepository<FeeHouse, Integer> {
    Optional<FeeHouse> findByFee_IdAndHouse_Id(int feeId, int houseId);
    List<FeeHouse> findByHouseId(int house_id);
    FeeHouse findByHouseIdAndFee(int house_id, Fee fee);
}
