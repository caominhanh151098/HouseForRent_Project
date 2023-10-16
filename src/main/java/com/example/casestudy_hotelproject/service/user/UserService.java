package com.example.casestudy_hotelproject.service.user;

import com.example.casestudy_hotelproject.config.JwtService;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.IdentityPaper;
import com.example.casestudy_hotelproject.model.InterestDetail;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.model.enums.IdentityType;
import com.example.casestudy_hotelproject.repository.IdentityPaperRepository;
import com.example.casestudy_hotelproject.repository.ReviewRepository;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.house.response.ShowInfoHouseOfHostResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseForAdminResponse;
import com.example.casestudy_hotelproject.service.interest.response.ShowInterestUserResponse;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.user.response.*;
import com.example.casestudy_hotelproject.service.user.request.UserRequest;
import com.example.casestudy_hotelproject.service.user.response.ShowStatisticalUserForAdminResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowUserCreateDateAdminResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowUserDetailResponse;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final ReviewRepository reviewRepository;
    private final JwtService jwtService;
    private final IdentityPaperRepository identityPaperRepository;

    public Page<UserResponse> findAll(String search, Pageable pageable) {

        search = "%" + search + "%";


        Page<UserResponse> responses = userRepository.findAllWithSearchAndPaging(search, pageable)
                .map(e -> AppUtils.mapper.map(e, UserResponse.class));
        return responses;


    }

    public Page<UserResponse> findAllUserBan(String search , Pageable pageable){
        search = "%" + search + "%";

        Page<UserResponse> responses = userRepository.findAllUserBan(search , pageable)
                .map(e -> AppUtils.mapper.map(e , UserResponse.class));
        return  responses;
    }

    public void changeStatusUser(String id ,String status){
        User user = userRepository.findById(Integer.parseInt(id));
        user.setStatus(Boolean.parseBoolean(status));

        userRepository.save(user);
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
        userResp.setNumReview(reviewRepository.countAllReviewByUser(userId));
        userResp.setMiniReview(reviewRepository.getReviewUserByGuest(userId, pageable).getContent()
                .stream()
                .map(r -> AppUtils.mapper.map(r, ContentReviewResponse.class))
                .collect(Collectors.toList()));
        userResp.setInterestList(interestList);
        userResp.setNameRole(user.getRole().getLangVi());
        return userResp;
    }

    public void checkIdentity(User user, ShowUserDetailResponse userResp) {
        userResp.setConfirmIdentity(user.getIdentity() != null);
        userResp.setConfirmEmail(user.getEmail() != null);
        userResp.setConfirmPhone(user.getPhone() != null);
    }

    public boolean addPhoneNumber(String phone) {
        User user = getCurrentUser();
        user.setPhone(phone);
        userRepository.save(user);
        return true;
    }


    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String userEmail = authentication.getName();
        return userRepository.findByEmail(userEmail).orElseThrow();
    }

    public List<ShowUserCreateDateAdminResponse> showUserCreateDateAdminResponses(int day,int year){

        List<ShowUserCreateDateAdminResponse> responses = userRepository.findAllUserCreateDateWithMonthAndYear(day,year)
                .stream().map(e -> AppUtils.mapper.map(e , ShowUserCreateDateAdminResponse.class)).toList();

        return responses;
    }

    public List<ShowStatisticalUserForAdminResponse> showStatisticalUserForAdminResponses(String date1 , String date2){
        LocalDate dateNew1 = LocalDate.parse(date1);
        LocalDate dateNew2 = LocalDate.parse(date2);

        List<ShowStatisticalUserForAdminResponse> responses = userRepository.findAllUserCreateDate(dateNew1,dateNew2)
                .stream().map(e -> AppUtils.mapper.map(e , ShowStatisticalUserForAdminResponse.class)).toList();

        return  responses;
    }

    public UserInfoResponse getInfoUser() {
        User user = getCurrentUser();
        return AppUtils.mapper.map(user, UserInfoResponse.class);
    }

    public UserInfoResponse updateUserInfo(Map<String, Object> updates) {
        User user = getCurrentUser();
        if (updates.containsKey("firstName")) {
            user.setFirstName((String) updates.get("firstName"));
        }
        if (updates.containsKey("lastName")) {
            user.setLastName((String) updates.get("lastName"));
        }
        if (updates.containsKey("email")) {
            user.setEmail((String) updates.get("email"));
        }
        if (updates.containsKey("phone")) {
            user.setPhone((String) updates.get("phone"));
        }
        if (updates.containsKey("identity")) {
            Object identityObj = updates.get("identity");
            IdentityPaper identity;
            if (identityObj instanceof Integer) {
                int identityId = (Integer) identityObj;
                identity = identityPaperRepository.findById(identityId).orElse(null);
            } else if (identityObj instanceof Map) {
                Map<String, Object> identityData = (Map<String, Object>) identityObj;

                if (user.getIdentity() != null) {
                    identity = user.getIdentity();
                    identity.setSrcImgFrontSide((String) identityData.get("srcImgFrontSide"));
                    identity.setSrcImgBackSide((String) identityData.get("srcImgBackSide"));
                } else {
                    identity = new IdentityPaper();
                    identity.setType(IdentityType.ID_CARD);
                    identity.setSrcImgFrontSide((String) identityData.get("srcImgFrontSide"));
                    identity.setSrcImgBackSide((String) identityData.get("srcImgBackSide"));
                    identity = identityPaperRepository.save(identity);
                }
            } else {
                throw new IllegalArgumentException("Invalid identity format");
            }
            user.setIdentity(identity);
        }
        userRepository.save(user);
        return AppUtils.mapper.map(user, UserInfoResponse.class);
    }

    public void verifyEmail() {
        User user = getCurrentUser();
        user.setVerifyEmail(true);
        userRepository.save(user);
    }
}
