package com.example.casestudy_hotelproject.controller.admin;

import com.example.casestudy_hotelproject.service.dataSocket.response.DataSocketResponse;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.request.UpdateStatusHouseAdmin;
import com.example.casestudy_hotelproject.service.house.response.*;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/admin/houses")
public class AdminHouseRestController {

    private final HouseService houseService;
    @GetMapping
    public Page<ShowListHouseForAdminResponse> showAll(Pageable pageable , @RequestParam(defaultValue = "") String search){
        return houseService.showListHouseForAdmin(search , pageable );
    }

    @GetMapping("/createdDate")
    public List<ShowHouseCreateDateAdminResponse> showAllHouseCreateDate(int month, int year){
        return houseService.showHouseCreateDateAdminResponses(month , year);
    }

    @GetMapping("/report")
    public List<ShowStatisticalHouseForAdminResponse> showStatisticalHouseForAdminResponses(String date1 , String date2){
        return  houseService.showStatisticalHouseForAdminResponses(date1 , date2);
    }

    @GetMapping("/accepted")
    public Page<ShowListHouseAcceptAdminResponse> showListHouseAcceptAdmins(Pageable pageable , @RequestParam(defaultValue = "") String search){
        return houseService.showAllAcceptHouse(pageable , search);
    }

    @PatchMapping("/update/{id}")
    public ResponseEntity<?> updateStatusAdmin( @PathVariable String id , @RequestBody UpdateStatusHouseAdmin request){
        try {

            houseService.updateStatusAdmin(id, request.getStatus() , request.getConfirmPDF());
            return ResponseEntity.ok("Success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed");
        }
    }


    @PatchMapping("/set-status/{id}")
    public ResponseEntity<?> updateHouseStatus(@PathVariable String id , @RequestBody UpdateStatusHouseAdmin request){
        try {
            houseService.updateStatusAdmin(id , request.getStatus());
            return ResponseEntity.ok("Success");
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed");
        }
    }

    @GetMapping("/cancel")
    public Page<ShowListHouseAcceptAdminResponse> showAllCancelHouse(Pageable pageable , @RequestParam(defaultValue = "") String search){
        return houseService.showAllCancelHouse(pageable , search);
    }
}
