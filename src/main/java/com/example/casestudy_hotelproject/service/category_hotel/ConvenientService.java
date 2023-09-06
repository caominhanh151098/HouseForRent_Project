package com.example.casestudy_hotelproject.service.category_hotel;

import com.example.casestudy_hotelproject.repository.ConvenientRepository;
import com.example.casestudy_hotelproject.service.category_hotel.response.ListConvenientResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ConvenientService {
    private final ConvenientRepository convenientRepository;

    public List<ListConvenientResponse> getListCategory() {
        return convenientRepository.findAll()
                .stream()
                .map(e -> AppUtils.mapper.map(e, ListConvenientResponse.class)).collect(Collectors.toList());
    }
}
