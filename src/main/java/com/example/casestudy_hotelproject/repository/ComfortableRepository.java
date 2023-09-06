package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Comfortable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComfortableRepository extends JpaRepository<Comfortable, Integer> {
    @Query(value = "SELECT c FROM Comfortable c JOIN ComfortableDetail cd ON c.id = cd.comfortable.id WHERE cd.house.id = :houseId")
    List<Comfortable> getListComfortableByHouseId(int houseId);

    Comfortable findByName(String name);
}
