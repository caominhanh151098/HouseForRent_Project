package com.example.casestudy_hotelproject.service.rule.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RuleHouseRespone {
    private int id;
    private LocalTime startTime;
    private LocalTime endTime;
    private String other;
    private String status;
    private RuleRespone rule;
}
