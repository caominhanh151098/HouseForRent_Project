package com.example.casestudy_hotelproject.service.payment.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class GetRefundRequest {
    private String reservationId;
    private String createBy;
    private String transactionType;
}
