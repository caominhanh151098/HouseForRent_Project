package com.example.casestudy_hotelproject.service.user;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.InterestDetail;
import com.example.casestudy_hotelproject.model.Review;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.repository.ReviewRepository;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.house.response.ShowInfoHouseOfHostResponse;
import com.example.casestudy_hotelproject.service.interest.response.ShowInterestUserResponse;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowUserDetailResponse;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;

    public Page<UserResponse> findAll(String search, Pageable pageable) {
        search = "%" + search + "%";
        List<User> users = userRepository.findAll();

        Page<UserResponse> responses = userRepository.findAllWithSearchAndPaging(search, pageable)
                .map(e -> AppUtils.mapper.map(e, UserResponse.class));

        return responses;


    }

    public User findById(int id) {
        return userRepository.findById(id);
    }

    public ShowUserDetailResponse getUserDetail(int userId, Pageable pageable) {
        User user = userRepository.findById(userId);
        ShowUserDetailResponse userResp = AppUtils.mapper.map(user, ShowUserDetailResponse.class);

        checkIdentity(user, userResp);
        List<ShowInterestUserResponse> interestList = new ArrayList<>();
        for (InterestDetail interest : user.getInterestDetails()) {
            interestList.add(AppUtils.mapper.map(interest.getInterest(), ShowInterestUserResponse.class));
        }
        List<House> houseList = user.getHotels();
        for (int index = 0; index < houseList.size(); index++) {
            House house = houseList.get(index);
            ShowInfoHouseOfHostResponse houseResp = userResp.getHotels().get(index);
            houseResp.setImage(house.getImages().get(0).getSrcImg());
            houseResp.setCategoryHotel(house.getCategoryHotel().getName());
        }
        userResp.setNumReview(reviewRepository.getCountReviewByUser(userId));
        userResp.setMiniReview(reviewRepository.getReviewUserByGuest(userId, pageable).getContent()
                .stream()
                .map(r -> AppUtils.mapper.map(r, ContentReviewResponse.class))
                .collect(Collectors.toList()));
        userResp.setInterestList(interestList);
        userResp.setNameRole(user.getRole().getLangVi());
        return userResp;
    }

    public void checkIdentity(User user, ShowUserDetailResponse userResp) {
        userResp.setConfirmIdentity(user.getIdentity() != null ? true : false);
        userResp.setConfirmEmail(user.getEmail() != null ? true : false);
        userResp.setConfirmPhone(user.getPhone() != null ? true : false);
    }
}
