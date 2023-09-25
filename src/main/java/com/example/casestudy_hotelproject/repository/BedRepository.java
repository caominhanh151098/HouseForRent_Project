package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Bed;
import com.example.casestudy_hotelproject.model.CategoryHotel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BedRepository extends JpaRepository<Bed, Integer> {
    void deleteByRoomId(int room_id);

}
