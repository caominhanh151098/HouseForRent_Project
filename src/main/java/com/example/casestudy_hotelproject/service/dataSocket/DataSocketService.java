package com.example.casestudy_hotelproject.service.dataSocket;

import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.service.dataSocket.response.DataSocketResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@AllArgsConstructor
public class DataSocketService {
    private final ReservationRepository reservationRepository;

    @Transactional
    public DataSocketResponse processData(String id){
        Reservation  reservation = reservationRepository.findReservationWithStatusFinish(Integer.parseInt(id));
        DataSocketResponse a = AppUtils.mapper.map(reservation , DataSocketResponse.class);
        if (reservation != null){
            return a;
        }
        else {
            return null;
        }
    }
}
