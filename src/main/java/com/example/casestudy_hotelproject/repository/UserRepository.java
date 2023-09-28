package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query(value = "select u from User u " +
            "where lower(u.firstName) like  lower(:search) " +
            "and lower(u.lastName) like lower(:search) " +
            "and lower(u.email) like lower(:search)")
    Page<User> findAllWithSearchAndPaging(String search, Pageable pageable);

    @Query(value = "SELECT u from User u " +
            "JOIN House h ON h.user.id = u.id " +
            "WHERE h.id = :houseId")
    User findUserByHouseId(int houseId);

    User findById(int id);
    Optional<User> findByEmail(String email);

    Optional<User> findByPhone(String phone);

    Optional<User> findUserByEmailOrPhone(String email, String phone);
}
