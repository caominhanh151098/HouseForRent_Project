package com.example.casestudy_hotelproject.service.surcharge;

import com.example.casestudy_hotelproject.model.Surcharge;
import com.example.casestudy_hotelproject.model.enums.SurchargeType;
import com.example.casestudy_hotelproject.repository.SurchargeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class SurchargeService {
    private SurchargeRepository surchargeRepository;
    public Surcharge getServiceFee(){
        return surchargeRepository.findSurchargeByType(SurchargeType.SERVICE_FEE);
    }
}
