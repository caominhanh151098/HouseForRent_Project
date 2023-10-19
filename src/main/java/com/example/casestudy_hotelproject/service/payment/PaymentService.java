package com.example.casestudy_hotelproject.service.payment;

import com.example.casestudy_hotelproject.config.TransactionConfig;
import com.example.casestudy_hotelproject.model.Payment;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.model.enums.StatusReservation;
import com.example.casestudy_hotelproject.repository.PaymentRepository;
import com.example.casestudy_hotelproject.repository.ReservationRepository;
import com.example.casestudy_hotelproject.service.payment.request.GetRefundRequest;
import com.example.casestudy_hotelproject.service.payment.request.GetTransactionRefundRequest;
import com.example.casestudy_hotelproject.service.payment.response.GetTransactionResponse;
import com.example.casestudy_hotelproject.service.payment.response.InfoPaymentRefundResponse;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
@AllArgsConstructor
public class PaymentService {
    private final PaymentRepository paymentRepository;
    private final ReservationRepository reservationRepository;

    public GetTransactionResponse createPayment(HttpServletRequest httpServletRequest, SaveReservationRequest request, Reservation reservation) throws UnsupportedEncodingException {
        String orderType = "other";
        String vnp_TxnRef = String.valueOf(reservation.getPayment().getTxnRef());
        String vnp_IpAddr = TransactionConfig.getIpAddress(httpServletRequest);
        String vnp_BankCode = "NCB";

        long amount = reservation.getTotalPrice().longValue() * 100000;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", TransactionConfig.vnp_Version);
        vnp_Params.put("vnp_Command", TransactionConfig.vnp_createPayment);
        vnp_Params.put("vnp_TmnCode", TransactionConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", vnp_BankCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan hoa don:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");

        vnp_Params.put("vnp_ReturnUrl", TransactionConfig.vnp_ReturnUrl(request, reservation));
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

//        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        LocalDateTime paymentTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String vnp_CreateDate = paymentTime.format(formatter);
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        LocalDateTime expireTime = paymentTime.plusMinutes(15);
        String vnp_ExpireDate = expireTime.format(formatter);
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

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
        String vnp_SecureHash = TransactionConfig.hmacSHA512(TransactionConfig.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = TransactionConfig.vnp_PayUrl + "?" + queryUrl;
        GetTransactionResponse getTransactionResponse = GetTransactionResponse.builder()
                .status("OK")
                .message("Successfully")
                .URL(paymentUrl)
                .build();
        return getTransactionResponse;
    }

    public InfoPaymentRefundResponse refundTransaction(HttpServletRequest httpServletRequest, GetRefundRequest request) throws NoSuchAlgorithmException {
        Reservation reservation = reservationRepository.findById(Integer.parseInt(request.getReservationId()));
        if (request.getCreateBy().equals("User")) {
            if (reservation.getStatus() != StatusReservation.WAIT_FOR_CHECKIN &&
                    reservation.getStatus() != StatusReservation.AWAITING_APPROVAL)
                return null;
        } else if (request.getCreateBy().equals("Host")) {
            if (reservation.getStatus() == StatusReservation.FINISH ||
                    reservation.getStatus() == StatusReservation.CANCEL ||
                    reservation.getStatus() == StatusReservation.REFUND ||
                    reservation.getStatus() == StatusReservation.REFUNDED)
                return null;
        }
        Payment payment = reservation.getPayment();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

        String vnp_RequestId = TransactionConfig.getRandomNumber(8);
        String vnp_Version = TransactionConfig.vnp_Version;
        String vnp_Command = TransactionConfig.vnp_refund;
        String vnp_TmnCode = TransactionConfig.vnp_TmnCode;
        String vnp_TransactionType = request.getTransactionType();
        String vnp_TxnRef = payment.getTxnRef();
        String vnp_Amount = String.valueOf((payment.getAmount().multiply(BigDecimal.valueOf(100000)).intValue()));
        String vnp_OrderInfo = "Hoan tien don hang: " + vnp_TxnRef;
        String vnp_TransactionNo = payment.getTransactionNo();
        String vnp_TransactionDate = payment.getCreateDate().format(formatter);
        String vnp_CreateBy = request.getCreateBy();
        String vnp_IpAddr = TransactionConfig.getIpAddress(httpServletRequest);

        String vnp_CreateDate = LocalDateTime.now().format(formatter);

        String vnp_SecureHash = TransactionConfig.generateVnpSecureHash(TransactionConfig.secretKey, vnp_RequestId, vnp_Version, vnp_Command, vnp_TmnCode, vnp_TransactionType, vnp_TxnRef, vnp_Amount, vnp_TransactionNo, vnp_TransactionDate, vnp_CreateBy, vnp_CreateDate, vnp_IpAddr, vnp_OrderInfo);

        GetTransactionRefundRequest refundResponse = GetTransactionRefundRequest
                .builder()
                .vnp_RequestId(vnp_RequestId)
                .vnp_Version(vnp_Version)
                .vnp_Command(vnp_Command)
                .vnp_TmnCode(vnp_TmnCode)
                .vnp_TransactionType(vnp_TransactionType)
                .vnp_TxnRef(vnp_TxnRef)
                .vnp_Amount(vnp_Amount)
                .vnp_OrderInfo(vnp_OrderInfo)
                .vnp_TransactionNo(vnp_TransactionNo)
                .vnp_TransactionDate(vnp_TransactionDate)
                .vnp_CreateBy(vnp_CreateBy)
                .vnp_CreateDate(vnp_CreateDate)
                .vnp_IpAddr(vnp_IpAddr)
                .vnp_SecureHash(vnp_SecureHash)
                .build();

        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<GetTransactionRefundRequest> requestEntity = new HttpEntity<>(refundResponse, headers);
        String apiUrl = TransactionConfig.vnp_QueryPaymentUrl;
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(apiUrl, requestEntity, String.class);
        String data = responseEntity.getBody().toString();

        Gson gson = new Gson();
        InfoPaymentRefundResponse response = gson.fromJson(data, InfoPaymentRefundResponse.class);
        if (response != null && response.getVnp_ResponseCode().equals("00"))
            return response;
        return null;
    }
}