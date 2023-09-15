package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface ImageRepository extends JpaRepository<Image, Integer> {
    List<Image> findAllByHouse_Id(int house_id);


}
