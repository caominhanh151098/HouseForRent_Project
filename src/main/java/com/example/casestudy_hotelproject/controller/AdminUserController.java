package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/admin/users")
@CrossOrigin(origins = "http://localhost:3000")
public class AdminUserController {


    private final UserService userService;

    @GetMapping
    public Page<UserResponse> findAll(@RequestParam(defaultValue = "") String search, Pageable pageable){
        return userService.findAll(search,pageable);
    }

}
