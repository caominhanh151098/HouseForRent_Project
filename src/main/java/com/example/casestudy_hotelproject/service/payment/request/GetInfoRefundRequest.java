package com.example.casestudy_hotelproject.service.payment.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class GetInfoRefundRequest {
    private String status;
    private String message;
    private String URL;
    private GetTransactionRefundRequest refundResponse;
}
