package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.GuestDetail;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailService;
import com.example.casestudy_hotelproject.service.payment.PaymentService;
import com.example.casestudy_hotelproject.service.payment.request.GetRefundRequest;
import com.example.casestudy_hotelproject.service.payment.response.InfoPaymentRefundResponse;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import com.example.casestudy_hotelproject.service.reservation.response.ReversationBlockResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowListReservationResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowRevenue;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/reservation")
@CrossOrigin(origins = "http://localhost:3000")
public class ReservationRestController {
    private final ReservationService reservationService;
    private final GuestDetailService guestDetailService;
    private final PaymentService paymentService;

    @PostMapping("/create")
    public void saveReservation(@RequestBody SaveReservationRequest request) {
//        reservationService.saveNewReservation(request);
    }

    @GetMapping("/willCheckOut")
    public List<ShowListReservationResponse> getReservationWillCheckOut() {
        return reservationService.getReservationWillBooked();
    }

    @GetMapping("/welcoming")
    public List<ShowListReservationResponse> getReservationWelcoming() {
        return reservationService.getReservationWelcoming();
    }

    @GetMapping("/coming")
    public List<ShowListReservationResponse> getReservationComing() {
        return reservationService.getReservationComing();
    }

    @GetMapping("/upcoming")
    public List<ShowListReservationResponse> getReservationUpComing() {
        return reservationService.getReservationUpComing();
    }

    @GetMapping("/waitApproval")
    public List<ShowListReservationResponse> getReservationWaitApproval() {
        return reservationService.getReservationWaitApproval();
    }

    @GetMapping("/delete/{reservationID}")
    public void deleteReservation(@PathVariable int reservationID) {
        reservationService.deleteReservation(reservationID);
    }

    @GetMapping("/accept/{reservationID}")
    public void acceptReservation(@PathVariable int reservationID) {
        reservationService.acceptReservation(reservationID);
    }

    @GetMapping("/getGuestDetail/{reservationID}")
    public GuestDetail getGuestDetail(@PathVariable int reservationID) {
        return guestDetailService.getGuestDetail(reservationID);
    }

    @GetMapping("/all/upcoming/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAllUpcoming(@PathVariable LocalDate startDate, @PathVariable LocalDate endDate, Pageable pageable) {
        return reservationService.getReservationAllUpcoming(startDate, endDate, pageable);
    }

    @GetMapping("/all/finished/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAllFinished(@PathVariable LocalDate startDate, @PathVariable LocalDate endDate, Pageable pageable) {
        return reservationService.getReservationAllFinished(startDate, endDate, pageable);
    }

    @GetMapping("/all/cancel/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAllCancel(@PathVariable LocalDate startDate, @PathVariable LocalDate endDate, Pageable pageable) {
        return reservationService.getReservationAllCancel(startDate, endDate, pageable);
    }

    @GetMapping("/all/all/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAll(@PathVariable LocalDate startDate, @PathVariable LocalDate endDate, Pageable pageable) {
        return reservationService.getReservationAll(startDate, endDate, pageable);
    }

    @GetMapping("/getReservationFinish/{houseId}/{startDate}/{endDate}")
    public Page<ShowRevenue> getReservationFinish(@PathVariable int houseId, @PathVariable LocalDate startDate, @PathVariable LocalDate endDate, @PageableDefault(size = 5) Pageable pageable) {
        if (houseId == -1) {
            return reservationService.getReservationFinishAll(startDate, endDate, pageable);
        } else {
            return reservationService.getReservationFinishWithHouseID(startDate, endDate, houseId, pageable);
        }
    }

    @GetMapping("/check-transaction/{paymentId}/{tnxRef}")
    public ResponseEntity<?> checkTransaction(@PathVariable int paymentId, @PathVariable String tnxRef, @RequestParam(value = "vnp_TransactionNo") String vnp_TransactionNo, @RequestParam(value = "vnp_PayDate") String vnp_PayDate) {
        if (reservationService.checkTransaction(paymentId, tnxRef, vnp_TransactionNo, vnp_PayDate)) {
            reservationService.changeStatus(paymentId);
            return ResponseEntity.status(HttpStatus.OK).body(true);
        } else
            return ResponseEntity.status(HttpStatus.OK).body(false);
    }

    @PostMapping("/delete-reservation/{paymentId}/{tnxRef}")
    public void deleteTransaction(@PathVariable int paymentId, @PathVariable String tnxRef) {
        reservationService.deleteTransaction(paymentId, tnxRef);
    }

    @PostMapping("/refund")
    public ResponseEntity<?> refundTransaction(HttpServletRequest httpServletRequest, @RequestBody GetRefundRequest refundRequest) throws NoSuchAlgorithmException {
        InfoPaymentRefundResponse refundResponse = paymentService.refundTransaction(httpServletRequest, refundRequest);
        if (refundResponse != null) ;
        reservationService.refundTransaction(Integer.parseInt(refundRequest.getReservationId()), refundResponse);
        return ResponseEntity.ok(true);
    }

    @GetMapping("/block/{houseId}")
    public List<ReversationBlockResponse> getReversationByHouseId(@PathVariable int houseId){
        return reservationService.getReversationByHouseId((houseId));
    }
}