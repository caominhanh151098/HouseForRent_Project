package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Reservation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='WAIT_FOR_CHECKIN'  and DATEDIFF( r.check_out_date,curdate()) = 1 ",nativeQuery = true)
    List<Reservation> getReservationWillBooked(@Param("userId") int userId);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_out_date,curdate())  >=0 and DATEDIFF( r.check_in_date,curdate())  <=0 ",nativeQuery = true)
    List<Reservation> getReservationWelComing(@Param("userId") int userId);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='WAIT_FOR_CHECKIN'  and DATEDIFF( r.check_in_date,curdate()) = 1 ",nativeQuery = true)
    List<Reservation> getReservationComing(@Param("userId") int userId);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_in_date,curdate()) > 0 ",nativeQuery = true)
    List<Reservation> getReservationUpComing(@Param("userId") int userId);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId  and DATEDIFF( r.check_in_date,curdate()) > 0 and r.status ='AWAITING_APPROVAL'",nativeQuery = true)
    List<Reservation> getReservationWaitApproval(@Param("userId") int userId);
    Reservation findById(int id);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_in_date,curdate()) >= 0  and DATEDIFF( r.check_in_date,:startDate ) >= 0  and DATEDIFF( r.check_in_date, :endDate )<0 "
            ,countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "           inner join `user` u on u.id = h.user_id " +
            "            where u.id= :userId and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_in_date,curdate()) > 0=  and DATEDIFF( r.check_in_date,:startDate ) >= 0  and DATEDIFF( r.check_in_date, :endDate )<0 "

            ,nativeQuery = true)
    Page<Reservation> getReservationAllUpcoming(@Param("userId")int userId, @Param("startDate")LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='WAIT_FOR_CHECKIN'   and DATEDIFF( r.check_out_date,:startDate ) >= 0  and DATEDIFF( r.check_out_date, :endDate )<=0 "
            ,countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "           inner join `user` u on u.id = h.user_id " +
            "           where u.id= :userId and r.status ='WAIT_FOR_CHECKIN'   and DATEDIFF( r.check_out_date,:startDate ) >= 0  and DATEDIFF( r.check_out_date, :endDate )<=0  "

            ,nativeQuery = true)
    Page<Reservation> getReservationAllFinished(@Param("userId") int userId, @Param("startDate")LocalDate startDate,@Param("endDate") LocalDate endDate,Pageable pageable);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId and r.status ='CANCEL'   and DATEDIFF( r.check_in_date,:startDate ) >= 0  and DATEDIFF( r.check_in_date, :endDate )<=0 "
            ,countQuery = "SELECT count(*) FROM reservation r " +
            "           inner join house h " +
            "          on r.house_id= h.id " +
            "         inner join `user` u on u.id = h.user_id " +
            "           where u.id= :userId and r.status ='CANCEL'   and DATEDIFF( r.check_in_date,:startDate ) >= 0  and DATEDIFF( r.check_in_date, :endDate )<=0  "

            ,nativeQuery = true)
    Page<Reservation> getReservationAllCancled(@Param("userId") int userId, @Param("startDate")LocalDate startDate,@Param("endDate") LocalDate endDate,Pageable pageable);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId    and DATEDIFF( r.check_in_date,:startDate ) >= 0  and DATEDIFF( r.check_in_date, :endDate )<=0 "
            ,countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "            inner join `user` u on u.id = h.user_id " +
            "            where u.id= :userId    and DATEDIFF( r.check_in_date,:startDate ) >= 0  and DATEDIFF( r.check_in_date, :endDate )<=0 "
            ,nativeQuery = true)
    Page<Reservation> getReservationAll(@Param("userId") int userId, @Param("startDate")LocalDate startDate,@Param("endDate") LocalDate endDate,Pageable pageable);
}
