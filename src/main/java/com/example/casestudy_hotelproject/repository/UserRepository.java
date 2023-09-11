package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User , Integer> {

    @Query(value = "select u from User u " +
            "where lower(u.firstName) like  lower(:search) " +
            "and lower(u.lastName) like lower(:search) " +
            "and lower(u.email) like lower(:search)")
    Page<User> findAllWithSearchAndPaging(String search , Pageable pageable);
User findById(int id);
}
