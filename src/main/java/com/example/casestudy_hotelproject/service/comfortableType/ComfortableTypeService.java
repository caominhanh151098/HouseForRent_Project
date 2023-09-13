package com.example.casestudy_hotelproject.service.comfortableType;

import com.example.casestudy_hotelproject.model.ComfortableType;
import com.example.casestudy_hotelproject.repository.ComfortableTypeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ComfortableTypeService {
    private final ComfortableTypeRepository comfortableTypeRepository;
    public List<ComfortableType> findAll (){
        return comfortableTypeRepository.findAll();
    }
}
