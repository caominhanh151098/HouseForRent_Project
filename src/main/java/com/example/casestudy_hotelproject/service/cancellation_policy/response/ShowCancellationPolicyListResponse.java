package com.example.casestudy_hotelproject.service.cancellation_policy.response;

import com.example.casestudy_hotelproject.model.enums.TypeCancellationPolicy;
import com.example.casestudy_hotelproject.model.enums.TypeRefundShortTerm;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class ShowCancellationPolicyListResponse {
    private boolean noRefunds;
    private String type;
    private String typeRefundShortTerm;
    private ShowCancellationPolicyResponse cancellationPolicy;
}
