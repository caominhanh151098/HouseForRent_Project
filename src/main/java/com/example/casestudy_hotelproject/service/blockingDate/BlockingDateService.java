package com.example.casestudy_hotelproject.service.blockingDate;

import com.example.casestudy_hotelproject.model.BlockingDate;
import com.example.casestudy_hotelproject.repository.BlockingDateRepository;
import com.example.casestudy_hotelproject.service.house.response.HouseOfHostReponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@AllArgsConstructor
@Data
@Service
public class BlockingDateService {
    private final BlockingDateRepository blockingDateRepository;
    public List<BlockingDateResponse> findBlockingDateByHouseId(int houseId){
        List<BlockingDate> blockingDates= blockingDateRepository.findBlockingDate(houseId);
        List<BlockingDateResponse> blockingDateResponses=blockingDates.stream().map(e-> AppUtils.mapper.map(e, BlockingDateResponse.class)).collect(Collectors.toList());
        return blockingDateResponses;
    }

}
