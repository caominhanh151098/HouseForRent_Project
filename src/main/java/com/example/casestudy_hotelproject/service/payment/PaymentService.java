package com.example.casestudy_hotelproject.service.payment;

import com.example.casestudy_hotelproject.config.TransactionConfig;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.service.payment.response.GetTransactionResponse;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@AllArgsConstructor
public class PaymentService {
    private final ReservationService reservationService;

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
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_Locale", "vn");

        vnp_Params.put("vnp_ReturnUrl", TransactionConfig.vnp_ReturnUrl(request, reservation));
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
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


}