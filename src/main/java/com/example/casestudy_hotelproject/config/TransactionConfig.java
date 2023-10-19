package com.example.casestudy_hotelproject.config;

import com.example.casestudy_hotelproject.model.GuestDetail;
import com.example.casestudy_hotelproject.model.Reservation;
import com.example.casestudy_hotelproject.service.guest_detail.response.SaveGuestDetailInReservationRequest;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import jakarta.servlet.http.HttpServletRequest;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class TransactionConfig {
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static String vnp_QueryPaymentUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";
    //    public static String vnp_ReturnUrl = "http://localhost:8080/vnpay_jsp/vnpay_return.jsp?orderId=";
    public static String vnp_Version = "2.1.0";
    public static String vnp_TmnCode = "W4FW59MG";
    public static String secretKey = "DHDPMJUFBHVGYXKQYWHYTNYRHUYBNXAX";
    public static String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";
    public static String vnp_createPayment = "pay";
    public static String vnp_queryPayment = "querydr";
    public static String vnp_refund = "refund";

    public static String vnp_ReturnUrl(SaveReservationRequest request, Reservation reservation) {
        SaveGuestDetailInReservationRequest guestDetail = request.getGuestDetail();
        return String.format("http://localhost:3000/book/%s/%s/%s/%s/%s/%s/%s/%s/%s",
                request.getHouseId(), guestDetail.getNumAdults(), guestDetail.getNumChildrenAbove2(), guestDetail.getNumBabies(),
                guestDetail.getNumPets(), request.getCheckInDate(), request.getCheckOutDate(), reservation.getPayment().getId(), reservation.getPayment().getTxnRef());
    }

    public static String md5(String message) {
        String digest = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hash = md.digest(message.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                sb.append(String.format("%02x", b & 0xff));
            }
            digest = sb.toString();
        } catch (UnsupportedEncodingException ex) {
            digest = "";
        } catch (NoSuchAlgorithmException ex) {
            digest = "";
        }
        return digest;
    }

    public static String Sha256(String message) {
        String digest = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(message.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                sb.append(String.format("%02x", b & 0xff));
            }
            digest = sb.toString();
        } catch (UnsupportedEncodingException ex) {
            digest = "";
        } catch (NoSuchAlgorithmException ex) {
            digest = "";
        }
        return digest;
    }

    //Util for VNPAY
    public static String hashAllFields(Map fields) {
        List fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames);
        StringBuilder sb = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) fields.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                sb.append(fieldName);
                sb.append("=");
                sb.append(fieldValue);
            }
            if (itr.hasNext()) {
                sb.append("&");
            }
        }
        return hmacSHA512(secretKey, sb.toString());
    }

    public static String hmacSHA512(final String key, final String data) {
        try {

            if (key == null || data == null) {
                throw new NullPointerException();
            }
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            return "";
        }
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ipAdress;
        try {
            ipAdress = request.getHeader("X-FORWARDED-FOR");
            if (ipAdress == null) {
                ipAdress = request.getRemoteAddr();
            }
        } catch (Exception e) {
            ipAdress = "Invalid IP:" + e.getMessage();
        }
        return ipAdress;
    }

    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

    public static String generateVnpSecureHash(String secretKey, String vnp_RequestId, String vnp_Version, String vnp_Command,
                                               String vnp_TmnCode, String vnp_TransactionType, String vnp_TxnRef,
                                               String vnp_Amount, String vnp_TransactionNo, String vnp_TransactionDate,
                                               String vnp_CreateBy, String vnp_CreateDate, String vnp_IpAddr, String vnp_OrderInfo) throws NoSuchAlgorithmException {
        String data = vnp_RequestId + "|" + vnp_Version + "|" + vnp_Command + "|" + vnp_TmnCode + "|" +
                vnp_TransactionType + "|" + vnp_TxnRef + "|" + vnp_Amount + "|" + vnp_TransactionNo + "|" +
                vnp_TransactionDate + "|" + vnp_CreateBy + "|" + vnp_CreateDate + "|" + vnp_IpAddr + "|" + vnp_OrderInfo;
        return hmacSHA512(secretKey, data);
    }
}
