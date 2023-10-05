package com.example.casestudy_hotelproject.service.reservation;

import com.example.casestudy_hotelproject.model.*;
import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.model.enums.SurchargeType;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.repository.SurchargeRepository;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import com.example.casestudy_hotelproject.service.reservation.response.ShowListReservationResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowRevenue;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final UserRepository userRepository;
    private final HouseRepository houseRepository;
    private final SurchargeRepository surchargeRepository;
    private final GuestDetailService guestDetailService;
    private final UserService userService;

    public void saveNewReservation(SaveReservationRequest request) {
        Reservation reservation = AppUtils.mapper.map(request, Reservation.class);
        House house = houseRepository.findById(Integer.parseInt(request.getHouseId()));
        reservation.setUser(userRepository.findById(Integer.parseInt(request.getUserId())));
        reservation.setHouse(house);
        reservation.setPrice(house.getPrice());
        reservation.setWeekendPrice(house.getWeekendPrice());
        reservation.setBookingFees(getCurrentBookingFeesByHouse(reservation, house));
        reservation.setStatus(house.isBookNow() ? StatusReservation.WAIT_FOR_CHECKIN : StatusReservation.AWAITING_APPROVAL);
        reservation.setTotalPrice(getPrice(reservation).setScale(0, RoundingMode.HALF_UP));
        reservationRepository.save(reservation);
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
                        bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType(), reservation));
                }
                case SHORT_STAY_CLEANING -> {
                    if (daysBetween <= 2)
                        bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType(), reservation));
                }
                case EXTRA_GUESS -> {
                    other = fee.getOther();
                    bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType(), reservation));
                }
                case PET -> {
                    bookingFees.add(new BookingFee(price, other, fee.getFee().getFeeType(), reservation));
                }
            }
        });
        List<Surcharge> surcharges = surchargeRepository.findAll();
        surcharges.forEach(surcharge -> {
            int other = 1;
            BigDecimal percent = BigDecimal.valueOf(surcharge.getPercent());

            bookingFees.add(new
                    BookingFee(percent, other, surcharge.getType() == SurchargeType.TAX ?
                    BookingFeeType.TAX : BookingFeeType.SERVICE_FEE, reservation));
        });
        return bookingFees;
    }

    public BigDecimal getPrice(Reservation reservation) {
        if (reservation.getWeekendPrice() == null) {
            reservation.setWeekendPrice(reservation.getPrice());
        }
        BigDecimal priceByDate = getPriceByDate(reservation);
        BigDecimal totalPrice = getTotalPrice(reservation, priceByDate);
        return totalPrice;
    }

    public BigDecimal getTotalPrice(Reservation reservation, BigDecimal priceByDate) {
        long daysBetween = reservation.getCheckInDate().until(reservation.getCheckOutDate(), ChronoUnit.DAYS);
        BigDecimal cleaningFee = BigDecimal.ZERO;
        BigDecimal petFee = BigDecimal.ZERO;
        BigDecimal taxFee = BigDecimal.ZERO;
        BigDecimal serviceFee = BigDecimal.ZERO;
        for (int index = 0; index < reservation.getBookingFees().size(); index++) {
            BookingFee bookingFee = reservation.getBookingFees().get(index);
            switch (bookingFee.getType()) {
                case CLEANING -> {
                    if (daysBetween > 2)
                        cleaningFee = bookingFee.getValue();
                }
                case SHORT_STAY_CLEANING -> {
                    if (daysBetween <= 2)
                        cleaningFee = bookingFee.getValue();
                }
                case PET -> {
                    if (reservation.getGuestDetail().getNumPets() > 0)
                        petFee = bookingFee.getValue();
                }
                case TAX -> {
                    taxFee = bookingFee.getValue();
                }
                case SERVICE_FEE -> {
                    serviceFee = bookingFee.getValue();
                }
            }
        }
        BigDecimal price = priceByDate.add(cleaningFee.add(petFee));
        BigDecimal totalPrice = price.add(price.multiply(serviceFee).divide(new BigDecimal(100)));
        return totalPrice;
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

        BigDecimal exPriceExGuest = getPriceExGuest(reservation);
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

    public List<ShowListReservationResponse> getReservationWillBooked() {
        User user=userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationWillBooked(user.getId());
        List<ShowListReservationResponse>list=s.stream().map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }
    public List<ShowListReservationResponse> getReservationComing(){
        User user=userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationComing(user.getId());
        List<ShowListReservationResponse>list=s.stream().map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }
    public  List<ShowListReservationResponse> getReservationWelcoming(){
        User user=userService.getCurrentUser();
        List<Reservation> s=reservationRepository.getReservationWelComing(user.getId());
        List<ShowListReservationResponse>list=s.stream().map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }
    public List<ShowListReservationResponse> getReservationUpComing(){
        User user=userService.getCurrentUser();
          List<Reservation> s=reservationRepository.getReservationUpComing(user.getId());
        List<ShowListReservationResponse>list=s.stream().map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }
    public List<ShowListReservationResponse> getReservationWaitApproval(){
        User user=userService.getCurrentUser();
        List<Reservation> s=reservationRepository.getReservationWaitApproval(user.getId());
        List<ShowListReservationResponse>list=s.stream().map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }
    public void deleteReservation(int reservationId){
      Reservation reservation=  reservationRepository.findById(reservationId);
        reservation.setStatus(StatusReservation.CANCEL);
        reservationRepository.save(reservation);
    }
    public void acceptReservation(int reservationId){
        Reservation reservation=  reservationRepository.findById(reservationId);
        reservation.setStatus(StatusReservation.WAIT_FOR_CHECKIN);
        reservationRepository.save(reservation);
    }
    public Page <ShowListReservationResponse> getReservationAllUpcoming(LocalDate startDate, LocalDate endDate, Pageable pageable){
        User user=userService.getCurrentUser();
        Page<Reservation> reservations=reservationRepository.getReservationAllUpcoming(user.getId(),startDate,endDate,pageable);
        Page<ShowListReservationResponse>list=reservations.map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }
    public Page <ShowListReservationResponse> getReservationAllFinished(LocalDate startDate,LocalDate endDate, Pageable pageable){
        User user=userService.getCurrentUser();
        Page<Reservation> reservations=reservationRepository.getReservationAllFinished(user.getId(),startDate,endDate,pageable);
        Page<ShowListReservationResponse>list=reservations.map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }
    public Page <ShowListReservationResponse> getReservationAllCancel(LocalDate startDate,LocalDate endDate, Pageable pageable){
        User user=userService.getCurrentUser();
        Page<Reservation> reservations=reservationRepository.getReservationAllCancled(user.getId(),startDate,endDate,pageable);
        Page<ShowListReservationResponse>list=reservations.map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }
    public Page <ShowListReservationResponse> getReservationAll(LocalDate startDate,LocalDate endDate, Pageable pageable){
        User user=userService.getCurrentUser();
        Page<Reservation> reservations=reservationRepository.getReservationAll(user.getId(),startDate,endDate,pageable);
        Page<ShowListReservationResponse>list=reservations.map(e-> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }
    public  Page <ShowRevenue>  getReservationFinishWithHouseID(LocalDate startDate, LocalDate endDate, int houseId, Pageable pageable){
        User user = userService.getCurrentUser();


        Page<Reservation> reservationPage= reservationRepository.getReservationFinishWithHouseId(user.getId(),startDate,endDate,houseId,pageable);
       Page<ShowRevenue> list  =reservationPage.map(e-> AppUtils.mapper.map(e, ShowRevenue.class));
        return list;
    }
    public  Page <ShowRevenue>  getReservationFinishAll(LocalDate startDate, LocalDate endDate, Pageable pageable){
        User user = userService.getCurrentUser();


        Page<Reservation> reservationPage= reservationRepository.getReservationFinishAll(user.getId(),startDate,endDate,pageable);
        Page<ShowRevenue> list  =reservationPage.map(e-> AppUtils.mapper.map(e, ShowRevenue.class));
        return list;
    }

}
