package com.example.casestudy_hotelproject.controller.admin;

import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.request.UserRequest;
import com.example.casestudy_hotelproject.service.user.response.ShowStatisticalUserForAdminResponse;
import com.example.casestudy_hotelproject.service.user.response.ShowUserCreateDateAdminResponse;
import com.example.casestudy_hotelproject.service.user.response.UserResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/admin/users")
@CrossOrigin(origins = "http://localhost:3000")
public class AdminUserRestController {

    private final UserService userService;
    @GetMapping
    public Page<UserResponse> findAll(@RequestParam(defaultValue = "") String search, Pageable pageable) {
        return userService.findAll(search, pageable);
    }

    @GetMapping("/user_ban")
    public Page<UserResponse> findAllUserBan(@RequestParam(defaultValue = "") String search , Pageable pageable){
        return  userService.findAllUserBan(search , pageable);
    }

    @PatchMapping("/update/{id}")
    public void changStatusUser(@PathVariable String id ,@RequestBody  UserRequest userRequest){
        userService.changeStatusUser(id , userRequest.getStatus());
    }

    @GetMapping("/createdDate")
    public List<ShowUserCreateDateAdminResponse> findAllWithDate(int month,int year){
        return userService.showUserCreateDateAdminResponses(month,year);
    }

    @GetMapping("/report")
    public List<ShowStatisticalUserForAdminResponse> showStatisticalUserForAdminResponses(String date1 , String date2){
        return  userService.showStatisticalUserForAdminResponses(date1 , date2);
    }
}
