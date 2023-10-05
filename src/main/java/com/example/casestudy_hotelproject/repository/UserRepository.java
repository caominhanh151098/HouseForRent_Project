package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query(value = "select u from User u " +
            "where lower(u.firstName) like  lower(:search) " +
            "or lower(u.lastName) like lower(:search) " +
            "or lower(u.email) like lower(:search)")
    Page<User> findAllWithSearchAndPaging(String search, Pageable pageable);

    @Query(value = "SELECT u from User u " +
            "JOIN House h ON h.user.id = u.id " +
            "WHERE h.id = :houseId")
    User findUserByHouseId(int houseId);

    User findById(int id);
    Optional<User> findByEmail(String email);

    Optional<User> findByPhone(String phone);

    Optional<User> findUserByEmailOrPhone(String email, String phone);

    @Query(nativeQuery = true, value = "select * from `user` u where (u.role = 'HOST' or u.role = 'GUEST') and (month(u.create_date) = :month and year(u.create_date) = :year);")
    List<User> findAllUserCreateDateWithMonthAndYear(@Param("month") int month,@Param("year") int year );

    @Query(nativeQuery = true, value = "select * from `user` u where (u.role = 'HOST' or u.role = 'GUEST') and (u.create_date between :date1 and :date2);")
    List<User> findAllUserCreateDate(@Param("date1") LocalDate date1, @Param("date2") LocalDate date2);
}
