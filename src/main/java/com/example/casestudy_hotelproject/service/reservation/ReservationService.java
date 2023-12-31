package com.example.casestudy_hotelproject.service.reservation;

import com.example.casestudy_hotelproject.model.*;
import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.model.enums.StatusPayment;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.model.enums.SurchargeType;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.repository.SurchargeRepository;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.blockingDate.BlockingDateRangeResponse;
import com.example.casestudy_hotelproject.service.dataSocket.response.DataSocketResponse;
import com.example.casestudy_hotelproject.repository.*;
import com.example.casestudy_hotelproject.service.payment.response.InfoPaymentRefundResponse;
import com.example.casestudy_hotelproject.service.house.response.HouseRevenueResponse;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import com.example.casestudy_hotelproject.service.reservation.response.*;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.hibernate.loader.NonUniqueDiscoveredSqlAliasException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
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
    private final PaymentRepository paymentRepository;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final UserService userService;

    public Reservation saveNewReservation(SaveReservationRequest request, String txnRef, String bankCode) {
        User user = userService.getCurrentUser();

        Reservation reservation = AppUtils.mapper.map(request, Reservation.class);
        House house = houseRepository.findById(Integer.parseInt(request.getHouseId()));
        reservation.setUser(user);
        reservation.setHouse(house);
        reservation.setPrice(house.getPrice());
        reservation.setWeekendPrice(house.getWeekendPrice());
        reservation.setBookingFees(getCurrentBookingFeesByHouse(reservation, house));
        reservation.setStatus(StatusReservation.WAITING_FOR_TRANSACTION);


        BigDecimal totalPrice = getPrice(reservation).setScale(-3, RoundingMode.HALF_UP);
        reservation.setTotalPrice(totalPrice);

        Payment payment = Payment.builder()
                .amount(totalPrice)
                .txnRef(txnRef)
                .bankCode(bankCode)
                .status(StatusPayment.FAIL)
                .build();

        reservation.setPayment(payment);

        return reservationRepository.save(reservation);
    }

    public List<BookingFee> getCurrentBookingFeesByHouse(Reservation reservation, House house) {
        long daysBetween = reservation.getCheckInDate().until(reservation.getCheckOutDate(), ChronoUnit.DAYS) + 1;
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
            BookingFeeType type = null;
            switch (surcharge.getType()) {
                case SERVICE_FEE:
                    type = BookingFeeType.SERVICE_FEE;
                    break;
                case HOST_FEE:
                    type = BookingFeeType.HOST_FEE;
                    break;
                case TAX:
                    type = BookingFeeType.TAX;
            }

            bookingFees.add(BookingFee
                    .builder()
                    .value(percent)
                    .other(other)
                    .type(type)
                    .reservation(reservation)
                    .build());
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
        startCal.setTime(Date.from(reservation.getCheckInDate().atStartOfDay(zoneId).toInstant()));

        Calendar endCal = Calendar.getInstance();
        endCal.setTime(Date.from(reservation.getCheckOutDate().atStartOfDay(zoneId).toInstant()));

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

    public List<ShowProfitForAdminResponse> showProfit(String date1, String date2) {

        LocalDate dateparse1 = LocalDate.parse(date1);
        LocalDate dateparse2 = LocalDate.parse(date2);

        List<Reservation> a = reservationRepository.showProfitWithStatus(dateparse1, dateparse2);

        List<ShowProfitForAdminResponse> reservations = reservationRepository.showProfitWithStatus(dateparse1, dateparse2)
                .stream().map(e -> AppUtils.mapper.map(e, ShowProfitForAdminResponse.class)).toList();

        return reservations;
    }

    public List<ShowReservationDateAdminResponse> showReservationDateAdminResponses(int month, int year) {
        List<ShowReservationDateAdminResponse> responses = reservationRepository.findAllReservationDateWithMonthAndYear(month, year)
                .stream().map(e -> AppUtils.mapper.map(e, ShowReservationDateAdminResponse.class)).toList();

        return responses;
    }

    public List<ShowTableProfitsForAdmin> showListHouseProfitsForAdminResponse(String date1, String date2) {
        LocalDate dateparse1 = LocalDate.parse(date1);
        LocalDate dateparse2 = LocalDate.parse(date2);
        List<Reservation> a = reservationRepository.findAllListHouseProfitsForAdmin(dateparse1, dateparse2);
        List<ShowTableProfitsForAdmin> responses = reservationRepository.findAllListHouseProfitsForAdmin(dateparse1, dateparse2)
                .stream().map(e -> AppUtils.mapper.map(e, ShowTableProfitsForAdmin.class)).toList();
        return responses;
    }

    @Transactional
    public void updateStatus(String id, String status , String completeDate) {
        int newId = Integer.parseInt(id);
        Reservation reservation = reservationRepository.findById(newId);
        reservation.setStatus(StatusReservation.valueOf(status));
        reservation.setCompleteDate(LocalDate.parse(completeDate));

        reservationRepository.save(reservation);
    }

    public List<ShowListReservationResponse> getReservationWillBooked() {
        User user = userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationWillBooked(user.getId());
        List<ShowListReservationResponse> list = s.stream().map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }

    public List<ReservationTest> showAll() {
        return reservationRepository.showAllStatus().stream().map(e -> AppUtils.mapper.map(e, ReservationTest.class)).toList();
    }

    public List<DataSocketResponse> findAllInday() {
        try {
            return reservationRepository.findAllListHouseProfitsInDay(LocalDate.now()).stream().map(e -> AppUtils.mapper.map(e, DataSocketResponse.class)).toList();

        } catch (NonUniqueDiscoveredSqlAliasException exception) {
            exception.getCause();
        }
        return null;
    }

    public List<ShowListReservationResponse> getReservationComing() {
        User user = userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationComing(user.getId());
        List<ShowListReservationResponse> list = s.stream().map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }

    public List<ShowListReservationResponse> getReservationWelcoming() {
        User user = userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationWelComing(user.getId());
        List<ShowListReservationResponse> list = s.stream().map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }

    public List<ShowListReservationResponse> getReservationUpComing() {
        User user = userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationUpComing(user.getId());
        List<ShowListReservationResponse> list = s.stream().map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }

    public List<ShowListReservationResponse> getReservationWaitApproval() {
        User user = userService.getCurrentUser();
        List<Reservation> s = reservationRepository.getReservationWaitApproval(user.getId());
        List<ShowListReservationResponse> list = s.stream().map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class)).collect(Collectors.toList());
        return list;
    }

    public void deleteReservation(int reservationId, InfoPaymentRefundResponse refundResponse) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

        Reservation reservation = reservationRepository.findById(reservationId);
        reservation.setStatus(StatusReservation.CANCEL);
        reservation.getPayment().setStatus(StatusPayment.REFUND);
        reservation.getPayment().setUpdateDate(LocalDateTime.parse(refundResponse.getVnp_PayDate(), formatter));
        reservationRepository.save(reservation);
    }

    public void acceptReservation(int reservationId) {
        Reservation reservation = reservationRepository.findById(reservationId);
        reservation.setStatus(StatusReservation.WAIT_FOR_CHECKIN);
        reservationRepository.save(reservation);
    }

    public Page<ShowListReservationResponse> getReservationAllUpcoming(LocalDate startDate, LocalDate endDate, Pageable pageable) {
        User user = userService.getCurrentUser();
        Page<Reservation> reservations = reservationRepository.getReservationAllUpcoming(user.getId(), startDate, endDate, pageable);
        Page<ShowListReservationResponse> list = reservations.map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }

    public Page<ShowListReservationResponse> getReservationAllFinished(LocalDate startDate, LocalDate endDate, Pageable pageable) {
        User user = userService.getCurrentUser();
        Page<Reservation> reservations = reservationRepository.getReservationAllFinished(user.getId(), startDate, endDate, pageable);
        Page<ShowListReservationResponse> list = reservations.map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }

    public Page<ShowListReservationResponse> getReservationAllCancel(LocalDate startDate, LocalDate endDate, Pageable pageable) {
        User user = userService.getCurrentUser();
        Page<Reservation> reservations = reservationRepository.getReservationAllCancled(user.getId(), startDate, endDate, pageable);
        Page<ShowListReservationResponse> list = reservations.map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }

    public Page<ShowListReservationResponse> getReservationAll(LocalDate startDate, LocalDate endDate, Pageable pageable) {
        User user = userService.getCurrentUser();
        Page<Reservation> reservations = reservationRepository.getReservationAll(user.getId(), startDate, endDate, pageable);
        Page<ShowListReservationResponse> list = reservations.map(e -> AppUtils.mapper.map(e, ShowListReservationResponse.class));
        return list;
    }

    public Page<ShowRevenue> getReservationFinishWithHouseID(LocalDate startDate, LocalDate endDate, int houseId, Pageable pageable) {
        User user = userService.getCurrentUser();
        Page<Reservation> reservationPage = reservationRepository.getReservationFinishWithHouseId(user.getId(), startDate, endDate, houseId, pageable);
        Page<ShowRevenue> list = reservationPage.map(e -> AppUtils.mapper.map(e, ShowRevenue.class));
        return list;
    }

    public Page<ShowRevenue> getReservationFinishAll(LocalDate startDate, LocalDate endDate, Pageable pageable) {
        User user = userService.getCurrentUser();
        Page<Reservation> reservationPage = reservationRepository.getReservationFinishAll(user.getId(), startDate, endDate, pageable);
        Page<ShowRevenue> list = reservationPage.map(e -> AppUtils.mapper.map(e, ShowRevenue.class));
        return list;
    }

    public void updatePayment(int reservationId, String transactionNo) {
        Reservation reservation = reservationRepository.findById(reservationId);
        reservation.getPayment().setTransactionNo(transactionNo);
        reservation.getPayment().setStatus(StatusPayment.SUCCESS);

        reservationRepository.save(reservation);
    }

    public boolean checkTransaction(int paymentId, String tnxRef, String vnp_TransactionNo, String vnp_PayDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        Payment payment = paymentRepository.findByIdAndTxnRef(paymentId, tnxRef).orElse(null);

        if (payment != null) {
            payment.setTransactionNo(vnp_TransactionNo);
            payment.setStatus(StatusPayment.SUCCESS);
            payment.setCreateDate(LocalDateTime.parse(vnp_PayDate, formatter));
            payment.setUpdateDate(LocalDateTime.parse(vnp_PayDate, formatter));
            paymentRepository.save(payment);
            return true;
        } else return false;
    }

    public void changeStatus(int paymentId) {
        Reservation reservation = reservationRepository.findByPaymentId(paymentId);
        House house = houseRepository.findById(reservation.getHouse().getId());
        reservation.setStatus(house.isBookNow() ? StatusReservation.WAIT_FOR_CHECKIN : StatusReservation.AWAITING_APPROVAL);
        reservationRepository.save(reservation);
    }

    public void deleteTransaction(int paymentId, String tnxRef) {
        Payment payment = paymentRepository.findByIdAndTxnRef(paymentId, tnxRef).orElse(null);
        reservationRepository.delete(reservationRepository.findByPayment(payment));
    }

    public void refundTransaction(int reservationId, InfoPaymentRefundResponse refundResponse) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

        Reservation reservation = reservationRepository.findById(reservationId);

        reservation.setStatus(StatusReservation.REFUND);
        reservation.getPayment().setStatus(StatusPayment.REFUND);
        reservation.getPayment().setUpdateDate(LocalDateTime.parse(refundResponse.getVnp_PayDate(), formatter));

        reservationRepository.save(reservation);
    }

    public List<ReversationBlockResponse> getReversationByHouseId(int id) {
        List<Reservation> reservations = reservationRepository.findByHouse_IdAndNotStatus(id);
        return reservations.stream().map(e -> AppUtils.mapper.map(e, ReversationBlockResponse.class)).collect(Collectors.toList());
    }

    public List<BlockingDateRangeResponse> getBlockingDateWithReservation(int houseID) {
        List<Reservation> reservations = reservationRepository.findByHouseIdAndStatus(houseID, StatusReservation.WAIT_FOR_CHECKIN);
        List<BlockingDateRangeResponse> blockingDateRangeResponses = reservations.stream().map(e -> AppUtils.mapper.map(e, BlockingDateRangeResponse.class)).collect(Collectors.toList());
        return blockingDateRangeResponses;
    }

    public void finishReservation(int reservationId) {
        Reservation reservation = reservationRepository.findById(reservationId);
        reservation.setCompleteDate(LocalDate.now());
        reservation.setStatus(StatusReservation.FINISH);
        reservationRepository.save(reservation);
    }   

    public List<Reservation> getReservationByUser() {
        User user = userService.getCurrentUser();
        return reservationRepository.findByUser(user);
    }


    public void cancelReservationById(int reservationId) {
        Reservation reservation = reservationRepository.findById(reservationId);
        if (reservation != null &&
                reservation.getStatus() == StatusReservation.WAIT_FOR_CHECKIN ||
                reservation.getStatus() == StatusReservation.AWAITING_APPROVAL ||
                reservation.getStatus() == StatusReservation.WAITING_FOR_TRANSACTION) {
            reservation.setStatus(StatusReservation.CANCEL);
            reservationRepository.save(reservation);
        } else {
            throw new RuntimeException("Error");
        }
    }
}
