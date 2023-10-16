package com.example.casestudy_hotelproject.service.house.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UpdateStatusHouseAdmin {
    private String id;
    private String status;
    private String confirmPDF;
    private UserAcceptResponse user;

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class UserAcceptResponse {
        private String id;

    }
}
