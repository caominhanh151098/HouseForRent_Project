package com.example.casestudy_hotelproject.service.comfortable;

import com.example.casestudy_hotelproject.model.Comfortable;
import com.example.casestudy_hotelproject.model.ComfortableDetail;
import com.example.casestudy_hotelproject.model.ComfortableType;
import com.example.casestudy_hotelproject.model.enums.TypeFilterComfortable;
import com.example.casestudy_hotelproject.repository.ComfortableDetailRepository;
import com.example.casestudy_hotelproject.repository.ComfortableRepository;
import com.example.casestudy_hotelproject.repository.ComfortableTypeRepository;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowComfortableDetailResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowDetailListComfortableResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowListFilterDetailResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowListFilterResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ComfortableService {
    private final ComfortableTypeRepository comfortableTypeRepository;
    private final ComfortableRepository comfortableRepository;
    private  final HouseRepository houseRepository;
    private final ComfortableDetailRepository comfortableDetailRepository;

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
                            comfortableDetail.setStatus(false);
                            comfortableDetail.setIcon(c.getIconNoneActive());
                            return comfortableDetail;
                        }).collect(Collectors.toList())));

        return comfortableListResp;
    }
    public void createComfortableDetail(ComfortableDetail comfortableDetail){
        comfortableDetailRepository.save(comfortableDetail);
    }
    public void deleteComfortableDetail(int houseId,int comfortableID){

       ComfortableDetail comfortableDetail= comfortableDetailRepository.findByHouseIdAndComfortableId(houseId,comfortableID);
        if(comfortableDetail==null){
            comfortableDetailRepository.save(new ComfortableDetail(houseRepository.findById(houseId),comfortableRepository.findById(comfortableID),false));
        }else {
            comfortableDetail.setStatus(false);
            comfortableDetailRepository.save(comfortableDetail);
        }
    }
    public  void addComfortableDetail(int houseId,int comfortableId){
        ComfortableDetail comfortableDetail= comfortableDetailRepository.findByHouseIdAndComfortableId(houseId,comfortableId);
        if(comfortableDetail==null){
            comfortableDetailRepository.save(new ComfortableDetail(houseRepository.findById(houseId),comfortableRepository.findById(comfortableId),true));
        }else {
            comfortableDetail.setStatus(true);
            comfortableDetailRepository.save(comfortableDetail);
        }
    }
    public List<Comfortable> getComfortable(){
        return comfortableRepository.findAll();
    }
    public List<ComfortableType> getComfortableType(){
        return comfortableTypeRepository.findAll();
    }

    public List<ShowListFilterResponse> getListFilter() {
        List<Comfortable> comfortableList = comfortableRepository.findAllByTypeFilterNotNull();
        List<ShowListFilterResponse> filterResponses = new ArrayList<>();
        Arrays.stream(TypeFilterComfortable.values()).toList().forEach(type -> {
            List<ShowListFilterDetailResponse> filterDetailLists = new ArrayList<>();
            comfortableList.forEach(comfortable -> {
                if (comfortable.getTypeFilter().name() == type.name()) {
                    filterDetailLists.add(AppUtils.mapper.map(comfortable, ShowListFilterDetailResponse.class));
                }
            });
            filterResponses.add(new ShowListFilterResponse(type.getLangVi(), filterDetailLists));
        });
        return filterResponses;
    }
}
