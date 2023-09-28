package com.example.casestudy_hotelproject.service.rule;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Rule;
import com.example.casestudy_hotelproject.model.RuleHouse;
import com.example.casestudy_hotelproject.model.enums.TypeInput;
import com.example.casestudy_hotelproject.model.enums.TypeRule;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.RuleHouseRepository;
import com.example.casestudy_hotelproject.repository.RuleRepository;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.rule.response.RuleBoolenRespone;
import com.example.casestudy_hotelproject.service.rule.response.RuleHouseRespone;
import com.example.casestudy_hotelproject.service.rule.response.ShowListRuleResponse;
import com.example.casestudy_hotelproject.service.rule.response.ShowRuleDetailResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class RuleService {
    private final RuleHouseRepository ruleHouseRepository;
    private final RuleRepository ruleRepository;
    private final HouseRepository houseRepository;

    public List<ShowRuleDetailResponse> showRuleByHouse(int houseId) {
        List<RuleHouse> ruleHouseList = ruleHouseRepository.findAllByHouse_Id(houseId);
        List<ShowRuleDetailResponse> rulesResp = new ArrayList<>();
        for (TypeRule type : TypeRule.values()) {
            List<ShowListRuleResponse> ruleList = new ArrayList<>();
            String typeRule = type == TypeRule.CHECKIN ? "Nhận và trả phòng" : "Trong thời gian ở";
            ruleHouseList.forEach(ruleHouse -> {
                if (ruleHouse.getRule().getType() == type) {
                    if (ruleHouse.getRule().getIcon() != null) {
                        String content = configContentRule(ruleHouse);
                        ShowListRuleResponse ruleReps = AppUtils.mapper.map(ruleHouse.getRule(), ShowListRuleResponse.class);
                        ruleReps.setContent(content);
                        ruleList.add(ruleReps);
                    }
                }
            });
            rulesResp.add(new ShowRuleDetailResponse(typeRule, ruleList));
        }
        return rulesResp;
    }

    public String configContentRule(RuleHouse ruleHouse) {
        Rule rule = ruleHouse.getRule();
        switch (rule.getInput()) {
            case BOOLEAN -> {
                if (!ruleHouse.isStatus()) {
                    rule.setName(String.format("Không được phép %s", rule.getName()));
                    rule.setIcon(rule.getIconNoneActive());
                }
            }
            case TIME -> {
                if (ruleHouse.getStartTime() != null && ruleHouse.getEndTime() != null) {
                    rule.setName(String.format("%s: %s - %s", rule.getName(), ruleHouse.getStartTime(), ruleHouse.getEndTime()));
                } else if (ruleHouse.getEndTime() != null) {
                    rule.setName(String.format("%s: Trước %s", rule.getName(), ruleHouse.getEndTime()));
                } else if (ruleHouse.getEndTime() != null) {
                    rule.setName(String.format("%s: Sau %s", rule.getName(), ruleHouse.getStartTime()));
                }
            }
            case STRING -> {
                return ruleHouse.getOther();
            }
        }
        return null;
    }
    public List<RuleHouseRespone> getRuleByhouseID (int houseID){
        List<RuleHouse> list =ruleHouseRepository.findAllByHouse_Id(houseID);
        List<RuleHouseRespone> ruleHouseRespones=list.stream().map(e-> AppUtils.mapper.map(e, RuleHouseRespone.class)).collect(Collectors.toList());
        return ruleHouseRespones;
    }
    public  List<RuleBoolenRespone>getRuleBoolean(){
        List<Rule> list =ruleRepository.findByInput(TypeInput.BOOLEAN);
        List<RuleBoolenRespone> ruleBoolenRespones=list.stream().map(e-> AppUtils.mapper.map(e, RuleBoolenRespone.class)).collect(Collectors.toList());
        return ruleBoolenRespones;
    }
    @Transactional
    public void updateQuietTime(int houseID ,String startTime,String endTime,int ruleId){
        House house=houseRepository.findById(houseID);
            RuleHouse ruleHouse= ruleHouseRepository.findByHouseIdAndRuleId(houseID,ruleId);
        if(Objects.equals(startTime, "Không có")){
            ruleHouseRepository.deleteByHouseIdAndRuleId(houseID,ruleId);
        }else if(ruleHouse==null){
            RuleHouse ruleHouse1=new RuleHouse(house,ruleRepository.findById(ruleId), LocalTime.parse(startTime+":00"),LocalTime.parse(endTime+":00"),false);
            ruleHouseRepository.save(ruleHouse1);
        }else {
            ruleHouse.setStartTime(LocalTime.parse(startTime+":00"));
            ruleHouse.setEndTime(LocalTime.parse(endTime+":00"));
            ruleHouseRepository.save(ruleHouse);
        }
    }
    public void updateOther (int houseID,String other){
        House house=houseRepository.findById(houseID);
        RuleHouse ruleHouse= ruleHouseRepository.findByHouseIdAndRuleId(houseID,9);

        if(ruleHouse==null){
            RuleHouse ruleHouse1=new RuleHouse(house,ruleRepository.findById(9),other,false);
            ruleHouseRepository.save(ruleHouse1);
        }else {
            ruleHouse.setOther(other);
            ruleHouseRepository.save(ruleHouse);
        }
    }
}
