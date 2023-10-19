package com.example.casestudy_hotelproject.controller.guest;

import com.example.casestudy_hotelproject.config.TransactionConfig;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailService;
import com.example.casestudy_hotelproject.service.payment.PaymentService;
import com.example.casestudy_hotelproject.service.payment.request.GetRefundRequest;
import com.example.casestudy_hotelproject.service.payment.response.GetTransactionResponse;
import com.example.casestudy_hotelproject.service.payment.response.InfoPaymentRefundResponse;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@RestController
@AllArgsConstructor
@RequestMapping("/api/guest/reservation")
@CrossOrigin(origins = "http://localhost:3000")
public class GuestReservationRestController {
    private final ReservationService reservationService;
    private final GuestDetailService guestDetailService;
    private final PaymentService paymentService;

    @PostMapping("/create")
    public ResponseEntity<?> saveReservation(HttpServletRequest httpServletRequest, @RequestBody SaveReservationRequest request) throws UnsupportedEncodingException {
        String vnp_TxnRef = TransactionConfig.getRandomNumber(8);
        String vnp_BankCode = "NCB";

        Reservation reservation = reservationService.saveNewReservation(request, vnp_TxnRef, vnp_BankCode);

        GetTransactionResponse getTransactionResponse = paymentService.createPayment(httpServletRequest, request, reservation);

        return ResponseEntity.status(HttpStatus.OK).body(getTransactionResponse);
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
        if (refundResponse != null);
            reservationService.refundTransaction(Integer.parseInt(refundRequest.getReservationId()), refundResponse);
        return ResponseEntity.ok(true);
    }
}
