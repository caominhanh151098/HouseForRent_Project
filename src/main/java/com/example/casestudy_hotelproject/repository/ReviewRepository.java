package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Set;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    Set<Review> getAllByHouse_Id(int houseId);
    Page<Review> findAllByHouse_Id(int houseId, Pageable pageable);

    @Query(nativeQuery = true, value = "SELECT r.* FROM review r " +
            "JOIN user u ON r.user_id = u.id " +
            "WHERE r.house_id = :houseId LIMIT 6")
    List<Review> getMiniReview(@Param("houseId") int houseId);
    int countAllByHouse_Id(int houseId);
}
