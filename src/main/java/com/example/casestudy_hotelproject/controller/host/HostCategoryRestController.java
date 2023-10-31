package com.example.casestudy_hotelproject.controller.host;

import com.example.casestudy_hotelproject.model.CategoryHotel;
import com.example.casestudy_hotelproject.repository.CategoryRepository;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/host/categories")
public class HostCategoryRestController {
    private final CategoryRepository categoryRepository;
    @GetMapping
    public List<CategoryHotel> findAll(){
        return   categoryRepository.findAll();
    }
}
