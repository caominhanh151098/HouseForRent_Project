package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.ComfortableType;
import com.example.casestudy_hotelproject.repository.ComfortableRepository;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowListFilterResponse;
import com.example.casestudy_hotelproject.service.comfortableType.ComfortableTypeService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@Data
@RequestMapping("/api/comfortable")
@CrossOrigin(origins = "http://localhost:3000")
public class ComfortableRestController {
   private final ComfortableService comfortableService;
    @GetMapping
    public List<Comfortable> findAll(){
        return comfortableService.getComfortable();
    }

    @GetMapping("/list-filter")
    public List<ShowListFilterResponse> showListFilter() {
        return comfortableService.getListFilter();
    }
    
    @GetMapping("/getComfortableType")
    public List<ComfortableType> getComfortableType(){
        return comfortableService.getComfortableType();
    }
}
