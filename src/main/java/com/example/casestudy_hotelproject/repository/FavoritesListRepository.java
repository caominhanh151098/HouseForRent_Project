package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.FavoritesList;
import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoritesListRepository extends JpaRepository<FavoritesList, Integer> {

    void removeByIdAndAndUser(int id, User user);
}
