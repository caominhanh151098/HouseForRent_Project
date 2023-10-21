package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.repository.BlockingDateRepository;
import com.example.casestudy_hotelproject.service.blockingDate.BlockingDateRangeResponse;
import com.example.casestudy_hotelproject.service.blockingDate.BlockingDateResponse;
import com.example.casestudy_hotelproject.service.blockingDate.BlockingDateService;
import com.example.casestudy_hotelproject.service.multi_calendar.CalendarService;
import com.example.casestudy_hotelproject.service.multi_calendar.request.SaveListBlockingDateRequest;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import lombok.AllArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/multiCalendars")
@CrossOrigin(origins = "http://localhost:3000")
public class MultiCalendarRestController {
    private final CalendarService calendarService;
    private final BlockingDateService blockingDateService;
    private final ReservationService reservationService;
    @PostMapping("/client/addBlockingDate")
    public void addBlockingDate(@RequestBody SaveListBlockingDateRequest request) {
        calendarService.addBlockingDate(request);
    }

    @PostMapping("/client/removeBlockingDate")
    public void removeBlockingDate(@RequestBody SaveListBlockingDateRequest request) {
        calendarService.removeBlockingDate(request);
    }
    @GetMapping("/client/getBlockingDate/{houseId}")
    public List<BlockingDateResponse> getBlockingDate(@PathVariable int houseId){
        return blockingDateService.findBlockingDateByHouseId(houseId);
    }
    @GetMapping("/client/getBlockingDateRange/{houseId}")
    public List<BlockingDateRangeResponse> getBlockingDateRange(@PathVariable int houseId){
        return reservationService.getBlockingDateWithReservation(houseId);
    }
}
