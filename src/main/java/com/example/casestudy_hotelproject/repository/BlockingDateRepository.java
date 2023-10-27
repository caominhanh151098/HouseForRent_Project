package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.BlockingDate;
import com.example.casestudy_hotelproject.model.House;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface BlockingDateRepository extends JpaRepository<BlockingDate, Integer> {
    Optional<BlockingDate> findByBlockingDateAndHouse(LocalDate blockingDate, House house);
    @Query(value ="SELECT * FROM blocking_date  WHERE blocking_date >= current_date() +  3  and house_id=:house_id", nativeQuery = true)
    List<BlockingDate> findBlockingDate(int house_id);
}
