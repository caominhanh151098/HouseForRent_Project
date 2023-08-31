package com.example.casestudy_hotelproject.service.user;

import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public Page<UserResponse> findAll(String search , Pageable pageable){
        search = "%" + search + "%";
        List<User> users = userRepository.findAll();

        Page<UserResponse> responses = userRepository.findAllWithSearchAndPaging(search, pageable)
                .map(e-> AppUtils.mapper.map(e , UserResponse.class));

        return responses;


    }
}
