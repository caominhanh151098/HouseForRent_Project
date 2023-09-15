package com.example.casestudy_hotelproject.service.user.response;

import com.example.casestudy_hotelproject.service.profile.response.ShowProfileHostInHouseDetailResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowHostInfoResponse {
    private int id;
    private String firstName;
    private String lastName;
    private String avatar;
    private String createDate;
    private int numReview;
    private Boolean confirmIdentity;
    private ShowProfileHostInHouseDetailResponse profile;
}
