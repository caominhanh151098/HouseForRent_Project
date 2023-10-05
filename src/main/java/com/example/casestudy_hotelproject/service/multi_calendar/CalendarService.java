package com.example.casestudy_hotelproject.service.multi_calendar;

import com.example.casestudy_hotelproject.model.BlockingDate;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.repository.BlockingDateRepository;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.multi_calendar.request.SaveListBlockingDateRequest;
import com.example.casestudy_hotelproject.service.user.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
@AllArgsConstructor
public class CalendarService {
    private final UserService userService;
    private final BlockingDateRepository blockingDateRepository;
    private final HouseRepository houseRepository;

    public void addBlockingDate(SaveListBlockingDateRequest request) {
        User user = userService.getCurrentUser();
        House house = houseRepository.findByIdAndUser_Id(Integer.parseInt(request.idHouse), user.getId()).orElseThrow();
        request.getListBlocking().forEach(date -> {
            BlockingDate blockingDate
                    = blockingDateRepository.findByBlockingDateAndHouse(LocalDate.parse(date), house)
                    .orElse(new BlockingDate().builder()
                            .house(house)
                            .blockingDate(LocalDate.parse(date))
                            .build());
            if (blockingDate.getId() == 0)
                blockingDateRepository.save(blockingDate);
        });
    }

    public void removeBlockingDate(SaveListBlockingDateRequest request) {
        User user = userService.getCurrentUser();
        House house = houseRepository.findByIdAndUser_Id(Integer.parseInt(request.idHouse), user.getId()).orElseThrow();
        request.getListBlocking().forEach(date -> {
            BlockingDate blockingDate
                    = blockingDateRepository.findByBlockingDateAndHouse(LocalDate.parse(date), house).orElse(null);
            if (blockingDate != null) {
                blockingDateRepository.delete(blockingDate);
            }
        });
    }
}
