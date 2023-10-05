package com.example.casestudy_hotelproject.service.fee;

import com.example.casestudy_hotelproject.model.Fee;
import com.example.casestudy_hotelproject.model.FeeHouse;
import com.example.casestudy_hotelproject.model.enums.BookingFeeType;
import com.example.casestudy_hotelproject.repository.FeeHouseRepository;
import com.example.casestudy_hotelproject.repository.FeeRepository;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.fee.response.SaveFeeCleaningHouseRequest;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class FeeService {
    private final FeeHouseRepository feeHouseRepository;
    private final FeeRepository feeRepository;
    private final HouseRepository houseRepository;

    private static List<Fee> feeList;

    public void settingFeeHouse(int idHouse, SaveFeeCleaningHouseRequest request) {
        feeList = feeRepository.findAll();
        BookingFeeType feeType = BookingFeeType.valueOf(request.getFeeType());

        feeList.forEach(fee -> {
            if(feeType == fee.getFeeType()) {
                FeeHouse feeHouse = feeHouseRepository.findByFee_IdAndHouse_Id(fee.getId(),idHouse)
                        .orElse(FeeHouse.builder()
                                .fee(fee)
                                .house(houseRepository.findById(idHouse))
                                .other(Integer.parseInt(request.getOther()))
                                .price(BigDecimal.valueOf(Long.valueOf(request.getPrice())))
                                .build());
                feeHouse.setPrice(BigDecimal.valueOf(Long.valueOf(request.getPrice())));
                feeHouse.setOther(Integer.parseInt(request.getOther()));
                feeHouseRepository.save(feeHouse);
            }
        });
    }
}
