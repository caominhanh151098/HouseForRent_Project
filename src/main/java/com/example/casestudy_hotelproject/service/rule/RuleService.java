package com.example.casestudy_hotelproject.service.rule;

import com.example.casestudy_hotelproject.model.Rule;
import com.example.casestudy_hotelproject.model.RuleHouse;
import com.example.casestudy_hotelproject.model.enums.TypeInput;
import com.example.casestudy_hotelproject.model.enums.TypeRule;
import com.example.casestudy_hotelproject.repository.RuleHouseRepository;
import com.example.casestudy_hotelproject.service.rule.response.ShowListRuleResponse;
import com.example.casestudy_hotelproject.service.rule.response.ShowRuleDetailResponse;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class RuleService {
    private final RuleHouseRepository ruleHouseRepository;

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
}
