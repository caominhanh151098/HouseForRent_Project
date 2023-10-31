package com.example.casestudy_hotelproject.controller.host;

import com.example.casestudy_hotelproject.service.category_hotel.ConvenientService;
import com.example.casestudy_hotelproject.service.category_hotel.response.ListConvenientResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/host/convenient")
public class HostConvenientRestController {
    public final ConvenientService convenientService;
    @GetMapping
    public List<ListConvenientResponse> getListConvenient() {
        return  convenientService.getListConvenient();
    }
}
