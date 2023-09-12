package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.repository.ComfortableRepository;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/comfortable")
@CrossOrigin(origins = "http://localhost:3000")
public class ComfortableRestController {
    private final ComfortableService comfortableService;
    @GetMapping
    public List<Comfortable> findAll(){
        return comfortableService.findAll();
    }
}
