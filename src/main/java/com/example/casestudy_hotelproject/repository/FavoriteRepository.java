package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Favorite;
import com.example.casestudy_hotelproject.model.FavoritesList;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.service.favoritesList.response.FavoriteHouseResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Integer> {
    Favorite findByHouseAndList(House house, FavoritesList list);

    void removeByHouse_IdAndList_User(int idHouse, User list_user);

    @Query("SELECT h.id FROM Favorite f INNER JOIN FavoritesList  fl ON f.list.id = fl.id INNER JOIN House h ON f.house.id = h.id INNER JOIN Location l ON h.location.id = l.id WHERE fl.user.id = :userId")
    List<Integer> findFavoriteHousesWithLocationByUserId(@Param("userId") int userId);

}
