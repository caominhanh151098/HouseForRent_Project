package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.BlockingDate;
import com.example.casestudy_hotelproject.model.House;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface BlockingDateRepository extends JpaRepository<BlockingDate, Integer> {
    Optional<BlockingDate> findByBlockingDateAndHouse(LocalDate blockingDate, House house);
}
