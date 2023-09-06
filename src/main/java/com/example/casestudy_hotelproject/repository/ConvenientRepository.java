package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Convenient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConvenientRepository extends JpaRepository<Convenient, Integer> {
    List<Convenient> findAll();
}
