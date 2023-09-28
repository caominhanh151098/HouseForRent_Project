package com.example.casestudy_hotelproject.service.guest_detail.response;

import com.example.casestudy_hotelproject.model.GuestDetail;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.service.house.response.HouseOfHostReponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@AllArgsConstructor

@Data
public class GuestDetailService {
    private final ReservationRepository reservationRepository;
    public GuestDetail getGuestDetail (int reservationId){
        Reservation reservation=reservationRepository.findById(reservationId);
       return reservation.getGuestDetail();

    }
}
