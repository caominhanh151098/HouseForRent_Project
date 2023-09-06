package com.example.casestudy_hotelproject.service.comfortable;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.ComfortableType;
import com.example.casestudy_hotelproject.repository.ComfortableRepository;
import com.example.casestudy_hotelproject.repository.ComfortableTypeRepository;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowDetailListComfortableResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ComfortableService {
    private final ComfortableTypeRepository comfortableTypeRepository;
    private final ComfortableRepository comfortableRepository;

    private List<ShowDetailListComfortableResponse> showListComfortableByHouseId(int idHouse) {
        List<Comfortable> comfortableList = comfortableRepository.getListComfortableByHouseId(idHouse);

        return null;
    }

}
