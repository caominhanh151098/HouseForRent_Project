package com.example.casestudy_hotelproject.service.cancellation_policy.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ShowCancellationPolicyResponse {
    private int beforeCheckInDate_Default;
    private int afterBookingDate;
    private int beforeCheckInDate_High;
    private int refundPercentage_High;
    private int beforeCheckInDate_Low;
    private int refundPercentage_Low;
}
