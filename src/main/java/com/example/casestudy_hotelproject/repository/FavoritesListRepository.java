package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.FavoritesList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FavoritesListRepository extends JpaRepository<FavoritesList, Integer> {
}
