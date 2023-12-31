package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.service.house.response.HouseDetailResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface HouseRepository extends JpaRepository<House, Integer> {
    @Query(value = "SELECT h FROM House h WHERE h.status = 'ACCEPTED'")
    Page<House> findAllInHomePage(Pageable pageable);

    House findById(int id);
    List<House>findByUser_Id(int user_id);

    @Query(value = "select h from House h where h.status = 'WAITING'")
    Page<House> findAllHouseForAdminWithStatusWaiting(Pageable pageable);

    @Query(value = "SELECT h " +
            "FROM House h " +
            "JOIN Favorite f ON h.id = f.house.id " +
            "WHERE f.list.id = :wishListId")
    Page<House> findAllByFavorites(int wishListId, Pageable pageable);

    @Query(value = "SELECT h FROM House h JOIN h.comfortableDetails cd WHERE cd.comfortable.id = :comfortableId")
    List<House> findHousesByComfortableId(@Param("comfortableId") int comfortableId);

    @Query(value = "SELECT h FROM House h WHERE " +
            "(:minPrice IS NULL OR h.price >= :minPrice) " +
            "AND (:maxPrice IS NULL OR h.price <= :maxPrice) " +
            "AND (:minGuests IS NULL OR h.quantityOfGuests >= :minGuests) " +
            "AND (:minRooms IS NULL OR h.quantityOfRooms >= :minRooms) " +
            "AND (:minBeds IS NULL OR h.quantityOfBeds >= :minBeds) " +
            "AND (:minBathrooms IS NULL OR h.quantityOfBathrooms >= :minBathrooms) " +
            "AND (EXISTS (" +
            "SELECT cd.house.id " +
            "FROM ComfortableDetail cd " +
            "WHERE cd.house.id = h.id AND cd.comfortable.id IN :comfortableIds" +
            ")) " +
            "AND (:categoryIds IS NULL OR h.categoryHotel.id IN :categoryIds)")
    List<House> findHousesByComfortableId(
            @Param("minPrice") BigDecimal minPrice,
            @Param("maxPrice") BigDecimal maxPrice,
            @Param("minGuests") Integer minGuests,
            @Param("minRooms") Integer minRooms,
            @Param("minBeds") Integer minBeds,
            @Param("minBathrooms") Integer minBathrooms,
            @Param("comfortableIds") List<Integer> comfortableIds,
            @Param("categoryIds") Integer categoryIds
    );

    @Query( value = "select h from House h join Location l on h.location.id = l.id where l.address like :city")
    List<House> findHousesByCity(String city);

    Optional<House> findByIdAndUser_Id(int id, int userId);

    @Query(value = "select h from House h left join User u on h.user.id = u.id where (h.status = 'WAITING') and (lower(h.hotelName) like lower(:search) or lower(u.firstName) like lower(:search) or lower(u.lastName) like lower(:search)) ")
    Page<House> findAllHouseForAdminWithStatusWaiting(Pageable pageable,String search);

    @Query(nativeQuery = true, value = "select * from house h where (h.status = 'ACCEPTED') and (month(h.create_date) = :month and year(h.create_date) = :year);")
    List<House> findAllHouseForAdminWithMonthAndYear(@Param("month") int month , @Param("year") int year);

    @Query(nativeQuery = true, value = "select * from house h where (h.status = 'ACCEPTED') and (h.create_date between :date1 and :date2);")
    List<House> findAllHouseWithDate(@Param("date1") LocalDate date1 , @Param("date2") LocalDate date2);

    @Query(value = "select h from House h left join User u on h.user.id = u.id where (h.status = 'ACCEPTED') and (lower(h.hotelName) like lower(:search) or lower(u.firstName) like lower(:search) or lower(u.lastName) like lower(:search))")
    Page<House> findAllHouseAdminStatusAccept(Pageable pageable, String search);

    @Query(value = "select h from House  h left join User u on h.user.id = u.id where (h.status = 'CANCEL') and (lower(h.hotelName) like lower(:search) or lower(u.firstName) like lower(:search) or lower(u.lastName) like lower(:search))")
    Page<House> findAllHouseAdminStatusCancel(Pageable pageable , String search);


    @Query(value = " select h1_0.id,h1_0.avg_review_point,h1_0.book_now,h1_0.category_id,h1_0.confirm_pdf,h1_0.create_date,h1_0.description_id,h1_0.ex_request_id,h1_0.hotel_name,h1_0.location_id,h1_0.price,h1_0.quantity_of_bathrooms,h1_0.quantity_of_beds,h1_0.quantity_of_guests,h1_0.quantity_of_rooms,h1_0.review_point_id,h1_0.status,h1_0.type_room,h1_0.user_id,h1_0.weekend_price,\n" +
            "\t\tl.address, l.longitude, l.latitude, GROUP_CONCAT(i.src_img SEPARATOR ' ') imgs\n,  c.`name`  as category_house_name, count(distinct r.id) as count_review" +
            "    from house h1_0\n" +
            "     left   join image i on h1_0.id = i.house_id\n" +
            "      left  join category_hotel c on c.id = h1_0.category_id\n" +
            "      left  join review r on r.house_id = h1_0.id\n" +
            "      left  join location l on h1_0.location_id = l.id " +
            " WHERE h1_0.status = 'ACCEPTED' group by h1_0.id", nativeQuery = true)
    List<HouseDetailResponse> findAllWithImage();
}