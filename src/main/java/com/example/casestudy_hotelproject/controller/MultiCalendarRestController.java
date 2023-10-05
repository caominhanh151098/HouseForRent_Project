package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.multi_calendar.CalendarService;
import com.example.casestudy_hotelproject.service.multi_calendar.request.SaveListBlockingDateRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/multi-calendars")
@CrossOrigin(origins = "http://localhost:3000")
public class MultiCalendarRestController {
    private final CalendarService calendarService;
    @PostMapping("/client/add-blocking-date")
    public void addBlockingDate(@RequestBody SaveListBlockingDateRequest request) {
        calendarService.addBlockingDate(request);
    }

    @DeleteMapping("/client/remove-blocking-date")
    public void removeBlockingDate(@RequestBody SaveListBlockingDateRequest request) {
        calendarService.removeBlockingDate(request);
    }
}
