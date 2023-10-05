package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Reservation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
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
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where  u.id= :userId and house_id= :houseId  and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            ,countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "            inner join `user` u on u.id = h.user_id " +
            "            where u.id= :userId and house_id= :houseId  and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            ,nativeQuery = true)
    Page<Reservation> getReservationFinishWithHouseId(@Param("userId") int userId,@Param("startDate")LocalDate startDate,@Param("endDate") LocalDate endDate,@Param("houseId") int houseId,Pageable pageable);
    @Query(value = "SELECT r.* FROM reservation r " +
            "inner join house h " +
            "on r.house_id= h.id " +
            "inner join `user` u on u.id = h.user_id " +
            "where  u.id= :userId   and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            ,countQuery = "SELECT count(*) FROM reservation r " +
            "            inner join house h " +
            "            on r.house_id= h.id " +
            "            inner join `user` u on u.id = h.user_id " +
            "            where u.id= :userId   and r.status ='FINISH'  and complete_date >= :startDate  and complete_date<= :endDate "
            ,nativeQuery = true)
    Page<Reservation> getReservationFinishAll(@Param("userId") int userId,@Param("startDate")LocalDate startDate,@Param("endDate") LocalDate endDate,Pageable pageable);

    @Query("SELECT r FROM Reservation r WHERE r.status = 'WAIT_FOR_CHECKIN'")
    List<Reservation> showAllStatus();

    @Query(nativeQuery = true, value = "select r.* , b.`value` , b.type from reservation r left join booking_fee b " +
            "on r.id = b.reservation_id where (r.status = 'FINISH') " +
            "and (b.`type` = 'SERVICE_FEE') " +
            "and (r.reservation_date between :date1 and  :date2)")
    List<Reservation> showProfitWithStatus(@Param("date1") LocalDate date1,@Param("date2") LocalDate date2);

    @Query(nativeQuery = true,value = "select * from reservation r where (r.status = 'FINISH') and (month(r.reservation_date) = :month and year(r.reservation_date) = :year)")
    List<Reservation> findAllReservationDateWithMonthAndYear(@Param("month") int month,@Param("year") int year);

    @Query(value = "select r,h,u,b from Reservation r " +
            "left join House h on r.house.id = h.id " +
            "left join User u on r.user.id = u.id " +
            "left join BookingFee b on r.id = b.reservation.id " +
            "where (r.status = 'FINISH') " +
            "and (b.type = 'SERVICE_FEE') " +
            " and (h.status = 'ACCEPTED')" +
            "and (r.reservationDate between :date1 and  :date2)")
    List<Reservation> findAllListHouseProfitsForAdmin(LocalDate date1,LocalDate date2);

//    @Query(value = "select r,h,u,b from Reservation r " +
//            "left join House h on r.house.id = h.id " +
//            "left join User u on r.user.id = u.id " +
//            "left join BookingFee b on r.id = b.reservation.id " +
//
//            "where (r.status = 'FINISH') " +
//            "and (b.type = 'SERVICE_FEE') " +
//            " and (h.status = 'ACCEPTED')" +
//            "and (r.reservationDate = :dateNow)")
//    List<Reservation> findAllListHouseProfitsInDay(LocalDate dateNow);

    @Query(nativeQuery = true, value = "select r.* , h.* , u.* , b.* from reservation r " +
            "left join house h on r.house_id = h.id  " +
            "    left join user u on r.user_id = u.id " +
            "    left join booking_fee b on r.id = b.reservation_id " +
            "      join (" +
            "  select r.id from reservation r where (r.reservation_date = :dateNow) group by r.id order by r.id DESC limit 1 " +
            "      ) t1 " +
            "    where (r.status = 'FINISH') " +
            "    and (b.type = 'SERVICE_FEE') " +
            "    and (h.status = 'ACCEPTED') " +
            "    and (r.reservation_date = :dateNow) " +
            "and (r.id = t1.id);")
    Reservation findAllListHouseProfitsInDay(@Param("dateNow") LocalDate dateNow);

    @Query(value = "select r,h,u,b from Reservation r " +
            "left join House h on r.house.id = h.id " +
            "left join User u on r.user.id = u.id " +
            "left join BookingFee b on r.id = b.reservation.id " +
            "where (b.type = 'SERVICE_FEE')  " +
            " and (r.id = :id)")
    Reservation findReservationWithStatusFinish(int id);

    Reservation findById(int id);
}
