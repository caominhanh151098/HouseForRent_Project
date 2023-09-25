package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.TypeRule;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalTime;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class RuleHouse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;
    @ManyToOne
    @JoinColumn(name = "rule_Id")
    private Rule rule;
    private LocalTime startTime;
    private LocalTime endTime;
    @Column(columnDefinition = "LONGTEXT")
    private String other;
    private boolean status = false;

    public RuleHouse(House house, Rule rule, String other, boolean status) {
        this.house = house;
        this.rule = rule;
        this.other = other;
        this.status = status;
    }

    public RuleHouse(House house, Rule rule, boolean status) {
        this.house = house;
        this.rule = rule;
        this.status = status;
    }

    public RuleHouse(House house, Rule rule, LocalTime startTime, LocalTime endTime, boolean status) {
        this.house = house;
        this.rule = rule;
        this.startTime = startTime;
        this.endTime = endTime;
        this.status = status;
    }

    @Override
    public String toString() {
        return "";
    }
}
