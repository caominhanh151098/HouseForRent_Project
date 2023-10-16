package com.example.casestudy_hotelproject.controller.host;

import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.service.fee.FeeService;
import com.example.casestudy_hotelproject.service.fee.response.FeeHouseHostResponse;
import com.example.casestudy_hotelproject.service.house.request.StringRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/host/feeHouse")
@CrossOrigin(origins = "http://localhost:3000")
public class HostFeeHouseResController {
    private FeeService feeService;
    @GetMapping("/getFeeHouse/{houseId}")
    public List<FeeHouseHostResponse> getFeeHouse(@PathVariable int houseId){
       return feeService.getFeeHouse(houseId);
    }
    @GetMapping("/editSurcharge/{houseId}/{type}/{price}")
    public void editSurcharge(@PathVariable int houseId, @PathVariable BookingFeeType type, @PathVariable BigDecimal price){
        feeService.editSurcharge(houseId,price,type);
    }
    @GetMapping("/editOther/{houseId}/{other}/{price}")
    public void editOther(@PathVariable int houseId, int  other, @PathVariable BigDecimal price){
        feeService.editOther(houseId,price,other);
    }

}
