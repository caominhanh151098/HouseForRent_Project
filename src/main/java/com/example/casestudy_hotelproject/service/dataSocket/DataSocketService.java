package com.example.casestudy_hotelproject.service.dataSocket;

import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.service.dataSocket.response.DataSocketResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@AllArgsConstructor
public class DataSocketService {
    private final ReservationRepository reservationRepository;

    public DataSocketResponse sendData(){
        LocalDate dateNow = LocalDate.now();
        Reservation data = reservationRepository.findAllListHouseProfitsInDay(dateNow);

        if (data != null) {
            DataSocketResponse response = AppUtils.mapper.map(data, DataSocketResponse.class);
            return response;
        } else {
            return null;
        }
    }

    public DataSocketResponse processData(String id){
        Reservation  reservation = reservationRepository.findReservationWithStatusFinish(Integer.parseInt(id));
        DataSocketResponse a = AppUtils.mapper.map(reservation , DataSocketResponse.class);
        if (reservation != null){
            return AppUtils.mapper.map(reservation , DataSocketResponse.class);
        }
        else {
            return null;
        }
    }
}
