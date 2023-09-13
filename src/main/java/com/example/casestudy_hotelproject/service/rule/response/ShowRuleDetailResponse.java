package com.example.casestudy_hotelproject.service.rule.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ShowRuleDetailResponse {
    public String typeRule;
    public List<ShowListRuleResponse> ruleList;
}
