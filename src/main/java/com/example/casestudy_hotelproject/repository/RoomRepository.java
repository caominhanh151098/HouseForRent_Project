package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepository extends JpaRepository<Room, Integer> {
    List<Room> findAllByHouse_Id(int house_Id);
}
