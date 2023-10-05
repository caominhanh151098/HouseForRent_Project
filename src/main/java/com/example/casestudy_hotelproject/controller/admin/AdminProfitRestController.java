package com.example.casestudy_hotelproject.controller.admin;


import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.ReservationTestRequest;
import com.example.casestudy_hotelproject.service.reservation.response.ReservationTest;
import com.example.casestudy_hotelproject.service.reservation.response.ShowProfitForAdminResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowReservationDateAdminResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowTableProfitsForAdmin;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("api/admin/profits")
@CrossOrigin(origins = "http://localhost:3000")
public class AdminProfitRestController {

    private final ReservationService reservationService;

    @GetMapping
    public List<ShowProfitForAdminResponse> showProfit(String date1,String date2){
        return reservationService.showProfit(date1,date2);
    }

    @GetMapping("/reservationDate")
    public List<ShowReservationDateAdminResponse> findAllWithMonthAndYear(int month , int year){
        return reservationService.showReservationDateAdminResponses(month , year);
    }

    @GetMapping("/houses")
    public List<ShowTableProfitsForAdmin> findAllHouseProfits (String date1,String date2){
        return reservationService.showListHouseProfitsForAdminResponse(date1 , date2);
    }


    @PatchMapping("/update/{id}")
    public ResponseEntity<?> updateData (@PathVariable String id , @RequestBody ReservationTestRequest request){
        reservationService.updateStatus(id , request.getStatus());
        return ResponseEntity.ok("Success");
    }
}
