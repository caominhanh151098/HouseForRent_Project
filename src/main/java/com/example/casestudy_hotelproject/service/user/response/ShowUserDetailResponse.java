package com.example.casestudy_hotelproject.service.user.response;

import com.example.casestudy_hotelproject.service.house.response.ShowInfoHouseOfHostResponse;
import com.example.casestudy_hotelproject.service.interest.response.ShowInterestUserResponse;
import com.example.casestudy_hotelproject.service.profile.response.ShowProfileUserResponse;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowUserDetailResponse {
    private int id;
    private String firstName;
    private String lastName;
    private String avatar;
    private String nameRole;
    private String role;
    private ShowProfileUserResponse profile;
    private int numReview;
    private Boolean confirmIdentity;
    private Boolean confirmEmail;
    private Boolean confirmPhone;
    
    private List<ContentReviewResponse> miniReview;
    private List<ShowInfoHouseOfHostResponse> hotels;
    private List<ShowInterestUserResponse> interestList;
}
