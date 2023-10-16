package com.example.casestudy_hotelproject.service.payment.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class GetTransactionResponse implements Serializable {
    private String status;
    private String message;
    private String URL;
}
