package com.example.casestudy_hotelproject.controller.guest;

import com.example.casestudy_hotelproject.config.TransactionConfig;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailService;
import com.example.casestudy_hotelproject.service.payment.PaymentService;
import com.example.casestudy_hotelproject.service.payment.response.GetTransactionResponse;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;

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
    public ResponseEntity<?> checkTransaction(@PathVariable int paymentId, @PathVariable int tnxRef, @RequestParam(value = "vnp_TransactionNo") long vnp_TransactionNo) {
        if (reservationService.checkTransaction(paymentId, tnxRef, vnp_TransactionNo))
            return ResponseEntity.status(HttpStatus.OK).body(true);
        else
            return ResponseEntity.status(HttpStatus.OK).body(false);
    }
}
