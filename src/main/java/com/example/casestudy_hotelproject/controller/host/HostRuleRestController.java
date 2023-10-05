package com.example.casestudy_hotelproject.controller.host;

import com.example.casestudy_hotelproject.service.rule.RuleService;
import com.example.casestudy_hotelproject.service.rule.response.RuleBoolenRespone;
import com.example.casestudy_hotelproject.service.rule.response.RuleHouseRespone;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/host/rule")
@CrossOrigin(origins = "http://localhost:3000")
public class HostRuleRestController {
    private final RuleService ruleService;
    @GetMapping("/getRule/{houseID}")
    public List<RuleHouseRespone> getRule(@PathVariable int houseID){
        return ruleService.getRuleByhouseID(houseID);
    }
    @GetMapping("/getRuleBoolen")
    public List<RuleBoolenRespone> getRuleBoolean(){
        return ruleService.getRuleBoolean();
    }
    @GetMapping("/updateQuietTime/{houseId}/{startTime}/{endTime}/{ruleId}")
    public void updateQuietTime(@PathVariable int houseId ,@PathVariable String startTime,@PathVariable String endTime,@PathVariable int ruleId){
        ruleService.updateQuietTime(houseId,startTime,endTime,ruleId);
    }
    @PostMapping("/updateOther/{houseId}")
    public void updateOther(@PathVariable int houseId , @RequestBody String other){
        ruleService.updateOther(houseId,other);
    }
}
