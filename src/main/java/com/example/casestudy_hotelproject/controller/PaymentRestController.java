package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.config.TransactionConfig;
import com.example.casestudy_hotelproject.model.Payment;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.service.payment.response.GetTransactionResponse;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

@AllArgsConstructor
@RestController
@RequestMapping("/api/payment")
@CrossOrigin(origins = "http://localhost:3000")
public class PaymentRestController {
    private final ReservationService reservationService;

//    @PostMapping("/create_payment")
//    public ResponseEntity<?> createPayment(HttpServletRequest httpServletRequest, @RequestBody SaveReservationRequest request) throws UnsupportedEncodingException {
//        String orderType = "other";
//        String vnp_TxnRef = TransactionConfig.getRandomNumber(8);
//        String vnp_IpAddr = TransactionConfig.getIpAddress(httpServletRequest);
//        String vnp_BankCode = "NCB";
//
//        Reservation reservation = reservationService.saveNewReservation(request, vnp_TxnRef, vnp_BankCode);
//        long amount = reservation.getTotalPrice().longValue() * 100000;
//
//        Map<String, String> vnp_Params = new HashMap<>();
//        vnp_Params.put("vnp_Version", TransactionConfig.vnp_Version);
//        vnp_Params.put("vnp_Command", TransactionConfig.vnp_createPayment);
//        vnp_Params.put("vnp_TmnCode", TransactionConfig.vnp_TmnCode);
//        vnp_Params.put("vnp_Amount", String.valueOf(amount));
//        vnp_Params.put("vnp_CurrCode", "VND");
//        vnp_Params.put("vnp_BankCode", vnp_BankCode);
//        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
//        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
//        vnp_Params.put("vnp_OrderType", orderType);
//        vnp_Params.put("vnp_Locale", "vn");
//
//        vnp_Params.put("vnp_ReturnUrl", TransactionConfig.vnp_ReturnUrl(reservation.getId()));
//        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
//
//        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//        String vnp_CreateDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
//
//        cld.add(Calendar.MINUTE, 15);
//        String vnp_ExpireDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
//
//        List fieldNames = new ArrayList(vnp_Params.keySet());
//        Collections.sort(fieldNames);
//        StringBuilder hashData = new StringBuilder();
//        StringBuilder query = new StringBuilder();
//        Iterator itr = fieldNames.iterator();
//        while (itr.hasNext()) {
//            String fieldName = (String) itr.next();
//            String fieldValue = (String) vnp_Params.get(fieldName);
//            if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                //Build hash data
//                hashData.append(fieldName);
//                hashData.append('=');
//                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                //Build query
//                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
//                query.append('=');
//                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                if (itr.hasNext()) {
//                    query.append('&');
//                    hashData.append('&');
//                }
//            }
//        }
//        String queryUrl = query.toString();
//        String vnp_SecureHash = TransactionConfig.hmacSHA512(TransactionConfig.secretKey, hashData.toString());
//        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
//        String paymentUrl = TransactionConfig.vnp_PayUrl + "?" + queryUrl;
//        GetTransactionResponse getTransactionResponse = GetTransactionResponse.builder()
//                .status("OK")
//                .message("Successfully")
//                .URL(paymentUrl)
//                .build();
//
//        return ResponseEntity.status(HttpStatus.OK).body(getTransactionResponse);
//    }

    @PostMapping("/get-query")
    public ResponseEntity<?> getQueryPayment(HttpServletRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException {
        String vnp_RequestId = "08176159";
        String vnp_Version = TransactionConfig.vnp_Version;
        String vnp_Command = TransactionConfig.vnp_queryPayment;
        String vnp_TmnCode = TransactionConfig.vnp_TmnCode;
        String vnp_TxnRef = TransactionConfig.getRandomNumber(8);
        String vnp_TransactionDate = "20231010090954";
        String vnp_IpAddr = TransactionConfig.getIpAddress(request);
        String vnp_OrderInfo = "Kiem tra hoa don:" + vnp_TxnRef;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_RequestId", vnp_RequestId);
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_TransactionNo", "14137296");
        vnp_Params.put("vnp_TransactionDate", vnp_TransactionDate);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }

        String queryUrl = query.toString();
        String vnp_SecureHash = TransactionConfig.generateVnpSecureHash(TransactionConfig.secretKey, vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, vnp_TxnRef, vnp_TransactionDate, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String queryTransaction = TransactionConfig.vnp_QueryPaymentUrl + "?" + queryUrl;
        GetTransactionResponse getTransactionResponse = GetTransactionResponse.builder()
                .status("OK")
                .message("Successfully")
                .URL(queryTransaction)
                .build();
//        String test = TransactionConfig.Sha256()

        return ResponseEntity.status(HttpStatus.OK).body(getTransactionResponse);
    }

    @PostMapping("/refund")
    public ResponseEntity<?> refundTransaction(HttpServletRequest request) {
        String vnp_RequestId = "08176159";
        String vnp_Version = TransactionConfig.vnp_Version;
        String vnp_Command = TransactionConfig.vnp_refund;
        String vnp_TmnCode = TransactionConfig.vnp_TmnCode;
        String vnp_TransactionType = "02";
        String vnp_TxnRef = TransactionConfig.getRandomNumber(8);
        String vnp_Amount = "50000000";
        String vnp_OrderInfo = "Hoàn tiền: " + vnp_TxnRef;
        String vnp_TransactionNo = "14137296";
        String vnp_TransactionDate = "20231010090954";
        String vnp_CreateBy = "Admin";
        String vnp_IpAddr = TransactionConfig.getIpAddress(request);

        Map<String, String> vnp_Params = new HashMap<>();

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);


        return ResponseEntity.status(HttpStatus.OK).body(null);
    }

    @GetMapping("/savePayment")
    public ResponseEntity<?> savePayment(
            @RequestParam(value = "reservationId") int reservationId,
            @RequestParam(value = "vnp_TransactionNo") long vnp_TransactionNo) {
        reservationService.updatePayment(reservationId, vnp_TransactionNo);
        return ResponseEntity.status(HttpStatus.OK).body("OK");
    }
}
