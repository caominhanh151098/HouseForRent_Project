package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Favorite;
import com.example.casestudy_hotelproject.model.FavoritesList;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Integer> {
    Favorite findByHouseAndList(House house, FavoritesList list);

    void removeByHouse_IdAndList_User(int idHouse, User list_user);
}
