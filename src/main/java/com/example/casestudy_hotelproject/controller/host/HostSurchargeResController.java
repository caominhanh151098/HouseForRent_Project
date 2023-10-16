package com.example.casestudy_hotelproject.controller.host;

import com.example.casestudy_hotelproject.model.Surcharge;
import com.example.casestudy_hotelproject.service.surcharge.SurchargeService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/host/surcharge")
@CrossOrigin(origins = "http://localhost:3000")
public class HostSurchargeResController {
    private final SurchargeService service;
    @GetMapping("getServiceFee")
    public Surcharge getServiceFee(){
        return service.getServiceFee();
    }
}
