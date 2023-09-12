package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Comfortable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComfortableRepository extends JpaRepository<Comfortable, Integer> {
    @Query(value = "SELECT c FROM Comfortable c JOIN ComfortableDetail cd ON c.id = cd.comfortable.id WHERE cd.house.id = :houseId AND cd.status = TRUE")
    List<Comfortable> getListComfortableByHouseId(int houseId);

//    @Query(value = "SELECT c.* FROM comfortable c JOIN comfortable_detail cd ON c.id = cd.comfortable_id WHERE cd.house_id = :houseId AND cd.status = TRUE",nativeQuery = true)
//    List<Comfortable> getMiniListComfortableByHouseId(@Param("houseId") int houseId);

    @Query(value = "SELECT c FROM Comfortable c WHERE c.configDefault = TRUE")
    List<Comfortable> getDefaultConfigComfortable();

    Comfortable findByName(String name);

}
