package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    Page<Review> findAllByHouse_Id(int houseId, Pageable pageable);

    @Query(nativeQuery = true, value = "SELECT r.* FROM review r " +
            "WHERE r.house_id = :houseId " +
            "ORDER BY r.review_date DESC LIMIT 6")
    List<Review> getMiniReview(@Param("houseId") int houseId);

    @Query(value = "SELECT r " +
            "FROM Review r JOIN House h ON r.house.id = h.id " +
            "WHERE h.user.id = :userId AND r.status = false")
    Page<Review> getReviewUserByGuest(@Param("userId") int userId, Pageable pageable);

    @Query(value = "SELECT r " +
            "FROM Review r JOIN House h ON r.house.id = h.id " +
            "WHERE r.user.id = :userId AND r.status = true ")
    Page<Review> getReviewUserByHost(@Param("userId") int userId, Pageable pageable);

    @Query("SELECT count(1) FROM Review r JOIN House h ON r.house.id = h.id " +
            "WHERE (r.status = false AND h.user.id = :userId) OR (r.status = true AND r.user.id = :userId)")
    int getCountReviewByUser(@Param("userId") int userId);

    int countAllByHouse_Id(int houseId);


}
