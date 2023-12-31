package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Payment;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    @Query(value = "SELECT r.* FROM reservation r " +
            "INNER JOIN house h ON r.house_id = h.id " +
            "INNER JOIN user u ON u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "WHERE u.id = :userId" +
            "            AND (p.status = 'SUCCESS' \n" +
            "            AND r.status = 'WAIT_FOR_CHECKIN' \n" +
            "            AND( DATEDIFF(r.check_out_date, current_date()) = 1+2) or (r.complete_date is null and DATEDIFF(r.check_out_date, current_date()) <2))" +
            " order by r.check_out_date desc", nativeQuery = true)
    Page<Reservation> getReservationWillBookedPage(@Param("userId") int userId, Pageable pageable);

    @Query(value = "SELECT r.* FROM reservation r " +
            "INNER JOIN house h ON r.house_id = h.id " +
            "INNER JOIN user u ON u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "WHERE u.id = :userId" +
            "            AND p.status = 'SUCCESS' \n" +
            "            AND r.status = 'WAIT_FOR_CHECKIN' \n" +
            "            AND( DATEDIFF(r.check_out_date, current_date()) = 4 or (r.complete_date is null and DATEDIFF(r.check_out_date, current_date()) <4)) " +
            "order by r.check_out_date desc", nativeQuery = true)
    List<Reservation> getReservationWillBooked(@Param("userId") int userId);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'SUCCESS'  and r.status ='WAIT_FOR_CHECKIN' and (((DATEDIFF( r.check_out_date,curdate())  >=3 and DATEDIFF( r.check_in_date,curdate())  <=2))  or (r.complete_date is null and DATEDIFF(r.check_out_date, current_date()) <3)) " +
            " order by r.check_out_date desc ", nativeQuery = true)
    List<Reservation> getReservationWelComing(@Param("userId") int userId);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'SUCCESS' and r.status ='WAIT_FOR_CHECKIN'  and DATEDIFF( r.check_in_date,curdate()) = 4 ", nativeQuery = true)
    List<Reservation> getReservationComing(@Param("userId") int userId);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'SUCCESS' and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_in_date,curdate()) > 4 ", nativeQuery = true)
    List<Reservation> getReservationUpComing(@Param("userId") int userId);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'SUCCESS' and DATEDIFF( r.check_in_date,curdate()) >= 2 and r.status ='AWAITING_APPROVAL'", nativeQuery = true)
    List<Reservation> getReservationWaitApproval(@Param("userId") int userId);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'SUCCESS' and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_in_date,curdate()) >= 2  and DATEDIFF( r.check_in_date,:startDate ) >= 2  and DATEDIFF( r.check_in_date, :endDate )<2 "
            , countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "           inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "            where u.id= :userId AND p.status = 'SUCCESS' and r.status ='WAIT_FOR_CHECKIN' and DATEDIFF( r.check_in_date,curdate()) >=2  and DATEDIFF( r.check_in_date,:startDate ) >= 2 and DATEDIFF( r.check_in_date, :endDate )<2 "

            , nativeQuery = true)
    Page<Reservation> getReservationAllUpcoming(@Param("userId") int userId, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'SUCCESS' and r.status ='WAIT_FOR_CHECKIN'   and DATEDIFF( r.check_out_date,:startDate ) >= 2  and DATEDIFF( r.check_out_date, :endDate )<=2 "
            , countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "           inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "           where u.id= :userId AND p.status = 'SUCCESS' and r.status ='WAIT_FOR_CHECKIN'   and DATEDIFF( r.check_out_date,:startDate ) >= 2  and DATEDIFF( r.check_out_date, :endDate )<=2  "

            , nativeQuery = true)
    Page<Reservation> getReservationAllFinished(@Param("userId") int userId, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "where u.id= :userId AND p.status = 'REFUND' and r.status ='CANCEL'   and DATEDIFF( r.check_in_date,:startDate ) >=2  and DATEDIFF( r.check_in_date, :endDate )<=2 "
            , countQuery = "SELECT count(*) FROM reservation r " +
            "           inner join house h " +
            "          on r.house_id= h.id " +
            "         inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "           where u.id= :userId AND p.status = 'REFUND' and r.status ='CANCEL'   and DATEDIFF( r.check_in_date,:startDate ) >= 2  and DATEDIFF( r.check_in_date, :endDate )<=2  "

            , nativeQuery = true)
    Page<Reservation> getReservationAllCancled(@Param("userId") int userId, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where u.id= :userId    and DATEDIFF( r.check_in_date,:startDate ) >= 2  and DATEDIFF( r.check_in_date, :endDate )<=2 "
            , countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "            inner join `user` u on u.id = h.user_id " +
            "INNER JOIN payment p ON p.id = r.payment_id " +
            "            where u.id= :userId   and DATEDIFF( r.check_in_date,:startDate ) >= 2  and DATEDIFF( r.check_in_date, :endDate )<=2 "
            , nativeQuery = true)
    Page<Reservation> getReservationAll(@Param("userId") int userId, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where  u.id= :userId and house_id= :houseId  and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            , countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "            inner join `user` u on u.id = h.user_id " +
            "            where u.id= :userId and house_id= :houseId  and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            , nativeQuery = true)
    Page<Reservation> getReservationFinishWithHouseId(@Param("userId") int userId, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, @Param("houseId") int houseId, Pageable pageable);

    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where  u.id= :userId   and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            , countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "            inner join `user` u on u.id = h.user_id " +
            "            where u.id= :userId   and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            , nativeQuery = true)
    Page<Reservation> getReservationFinishAll(@Param("userId") int userId, @Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate, Pageable pageable);

    @Query("SELECT r FROM Reservation r WHERE r.status = 'WAIT_FOR_CHECKIN'")
    List<Reservation> showAllStatus();

    @Query(nativeQuery = true, value = "select r.* , b.`value` , b.type from reservation r left join booking_fee b " +
            "on r.id = b.reservation_id where (r.status = 'FINISH') " +
            "and (b.`type` = 'SERVICE_FEE') " +
            "and (r.reservation_date between :date1 and  :date2)")
    List<Reservation> showProfitWithStatus(@Param("date1") LocalDate date1, @Param("date2") LocalDate date2);

    @Query(nativeQuery = true, value = "select * from reservation r where (r.status = 'FINISH') and (month(r.reservation_date) = :month and year(r.reservation_date) = :year)")
    List<Reservation> findAllReservationDateWithMonthAndYear(@Param("month") int month, @Param("year") int year);

    @Query(value = "select r,h,u,b from Reservation r " +
            "left join House h on r.house.id = h.id " +
            "left join User u on r.user.id = u.id " +
            "left join BookingFee b on r.id = b.reservation.id " +
            "where (r.status = 'FINISH') " +
            "and (b.type = 'SERVICE_FEE') " +
            " and (h.status = 'ACCEPTED')" +
            "and (r.reservationDate between :date1 and  :date2)")
    List<Reservation> findAllListHouseProfitsForAdmin(LocalDate date1, LocalDate date2);

    @Query(value = "select r , h , u , b from Reservation r " +
            "left join House h on r.house.id = h.id " +
            "left join User u on r.user.id = u.id " +
            "left join BookingFee b on r.id = b.reservation.id " +
            "where (r.status = 'FINISH') " +
            "and (b.type = 'SERVICE_FEE') " +
            "and (h.status = 'ACCEPTED') " +
            "and (r.completeDate = :dateNow) order by r.id ASC")
    List<Reservation> findAllListHouseProfitsInDay(LocalDate dateNow);

    @Query(value = "select r,h,u,b from Reservation r " +
            "left join House h on r.house.id = h.id " +
            "left join User u on r.user.id = u.id " +
            "left join BookingFee b on r.id = b.reservation.id " +
            "where (b.type = 'SERVICE_FEE')  " +
            " and (r.id = :id)")
    Reservation findReservationWithStatusFinish(int id);

    Reservation findById(int id);

    Reservation findByPaymentId(int paymentId);

    Reservation findByPayment(Payment payment);

    List<Reservation> findByHouseId(int house_id);
    @Query(value = "SELECT r.* FROM reservation r WHERE r.house_id = :house_id AND r.status NOT IN ('CANCEL', 'WAITING_FOR_TRANSACTION')",  nativeQuery = true)
    List<Reservation> findByHouse_IdAndNotStatus(int house_id);
    List<Reservation> findByHouseIdAndStatus(int house_id, StatusReservation status);
    List<Reservation> findByUser(User user);
}
