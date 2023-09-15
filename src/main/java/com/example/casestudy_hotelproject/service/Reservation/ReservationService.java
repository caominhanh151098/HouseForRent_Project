package com.example.casestudy_hotelproject.service.Reservation;

import com.example.casestudy_hotelproject.model.BookingFee;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.model.Surcharge;
import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.model.enums.SurchargeType;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.repository.SurchargeRepository;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.Reservation.request.SaveReservationRequest;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@AllArgsConstructor
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final UserRepository userRepository;
    private final HouseRepository houseRepository;
    private final SurchargeRepository surchargeRepository;

    public void saveNewReservation(SaveReservationRequest request) {
        Reservation reservation = AppUtils.mapper.map(request, Reservation.class);
        House house = houseRepository.findById(Integer.parseInt(request.getHouseId()));
        reservation.setUser(userRepository.findById(Integer.parseInt(request.getUserId())));
        reservation.setHouse(house);
        reservation.setPrice(house.getPrice());
        reservation.setWeekendPrice(house.getWeekendPrice());
        reservation.setBookingFees(getCurrentBookingFeesByHouse(reservation, house));
        reservation.setStatus(house.isBookNow() ? StatusReservation.WAIT_FOR_CHECKIN : StatusReservation.AWAITING_APPROVAL);
        reservation.setTotalPrice(getTotalPrice(reservation));
//        reservationRepository.save(reservation);
    }

    public List<BookingFee> getCurrentBookingFeesByHouse(Reservation reservation, House house) {
        long daysBetween = reservation.getCheckInDate().until(reservation.getCheckOutDate(), ChronoUnit.DAYS);
        List<BookingFee> bookingFees = new ArrayList<>();
        house.getFeeHouses().forEach(fee -> {
            BigDecimal price = fee.getPrice();
            int other = 1;
            switch (fee.getFee().getFeeType()) {
                case CLEANING -> {
                    if (daysBetween > 2)
                        bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType()));
                }
                case SHORT_STAY_CLEANING -> {
                    if (daysBetween <= 2)
                        bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType()));
                }
                case EXTRA_GUESS -> {
                    other = fee.getOther();
                    bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType()));
                }
                case PET -> {
                    bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType()));
                }
            }
        });
        List<Surcharge> surcharges = surchargeRepository.findAll();
        surcharges.forEach(surcharge -> {
            int other = 1;
            BigDecimal percent = BigDecimal.valueOf(surcharge.getPercent());

            bookingFees.add(new
                    BookingFee(percent, other, surcharge.getType() == SurchargeType.TAX ?
                    BookingFeeType.TAX : BookingFeeType.SERVICE_FEE));
        });
        return bookingFees;
    }

    public BigDecimal getTotalPrice(Reservation reservation) {
        long daysBetween = reservation.getCheckInDate().until(reservation.getCheckOutDate(), ChronoUnit.DAYS);
        if (reservation.getWeekendPrice() == null) {
            reservation.setWeekendPrice(reservation.getPrice());
        }
        BigDecimal price = getPriceByDate(reservation);
        return null;
    }

    public BigDecimal getPriceByDate(Reservation reservation) {
        BigDecimal price = BigDecimal.valueOf(0);
        ZoneId zoneId = ZoneId.systemDefault();
        Calendar startCal = Calendar.getInstance();
        startCal.setTime((Date.from(reservation.getCheckInDate().atStartOfDay(zoneId).toInstant())));

        Calendar endCal = Calendar.getInstance();
        endCal.setTime((Date.from(reservation.getCheckOutDate().atStartOfDay(zoneId).toInstant())));

        if (startCal.getTimeInMillis() == endCal.getTimeInMillis())
            return BigDecimal.ZERO;

        BigDecimal exPriceExGuest =  getPriceExGuest(reservation);
        do {
            startCal.add(Calendar.DAY_OF_MONTH, 1);
            if (startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY && startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
                price = price.add(reservation.getPrice().add(exPriceExGuest));
            } else price = price.add(reservation.getWeekendPrice().add(exPriceExGuest));
        } while (startCal.getTimeInMillis() < endCal.getTimeInMillis());
        return price;
    }

    public BigDecimal getPriceExGuest(Reservation reservation) {
        int numGuest = reservation.getGuestDetail().getNumAdults() + reservation.getGuestDetail().getNumChildrenAbove2();
        for (int index = 0; index < reservation.getBookingFees().size(); index++) {
            BookingFee bookingFee = reservation.getBookingFees().get(index);
            if (bookingFee.getType() == BookingFeeType.EXTRA_GUESS && bookingFee.getOther() < numGuest) {
                return bookingFee.getValue().multiply(BigDecimal.valueOf(numGuest - bookingFee.getOther()));
            }
        }
        return BigDecimal.ZERO;
    }
}
