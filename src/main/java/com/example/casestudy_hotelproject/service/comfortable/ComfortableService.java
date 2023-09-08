package com.example.casestudy_hotelproject.service.comfortable;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.ComfortableType;
import com.example.casestudy_hotelproject.repository.ComfortableRepository;
import com.example.casestudy_hotelproject.repository.ComfortableTypeRepository;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowComfortableDetailResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowDetailListComfortableResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ComfortableService {
    private final ComfortableTypeRepository comfortableTypeRepository;
    private final ComfortableRepository comfortableRepository;

    public List<ShowDetailListComfortableResponse> showListComfortableByHouseId(int idHouse) {
        List<ComfortableType> comfortableTypes = comfortableTypeRepository.findAll();
        List<Comfortable> comfortableList = comfortableRepository.getListComfortableByHouseId(idHouse);
        List<Comfortable> comfortablesDefaultList = comfortableRepository.getDefaultConfigComfortable();

        List<ShowDetailListComfortableResponse> comfortableListResp = new ArrayList<>();
        for (ComfortableType comfortableType : comfortableTypes) {
            List<ShowComfortableDetailResponse> comfortableDetailList = new ArrayList<>();
            for (Comfortable comfortable : comfortableList) {
                if (comfortable.getType().equals(comfortableType)) {
                    comfortableDetailList.add(AppUtils.mapper.map(comfortable, ShowComfortableDetailResponse.class));
                }
                if (comfortablesDefaultList.contains(comfortable)) {
                    comfortablesDefaultList.remove(comfortable);
                }
            }
            if (!comfortableDetailList.isEmpty())
                comfortableListResp.add(new ShowDetailListComfortableResponse(comfortableType.getName(), comfortableDetailList));
        }
        comfortableListResp.add(new ShowDetailListComfortableResponse("Không bao gồm",
                comfortablesDefaultList
                        .stream()
                        .map(c -> {
                            ShowComfortableDetailResponse comfortableDetail = AppUtils.mapper.map(c, ShowComfortableDetailResponse.class);
                            comfortableDetail.setStatus("false");
                            comfortableDetail.setIcon(c.getIconNoneActive());
                            return comfortableDetail;
                        }).collect(Collectors.toList())));

        return comfortableListResp;
    }

}
