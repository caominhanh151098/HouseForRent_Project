package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.TypeInput;
import com.example.casestudy_hotelproject.model.enums.TypeRule;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Rule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Column(columnDefinition = "LONGTEXT")
    private String icon;
    @Column(columnDefinition = "LONGTEXT")
    private String iconNoneActive;
    @Enumerated(EnumType.STRING)
    private TypeRule type;
    @Enumerated(EnumType.STRING)
    private TypeInput input;

    @OneToMany(mappedBy = "rule")
    private List<RuleHouse> ruleList;

    @Override
    public String toString() {
        return "";
    }
}
