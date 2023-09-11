package com.example.casestudy_hotelproject.model;
import com.example.casestudy_hotelproject.model.enums.InterestType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Set;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Interest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Enumerated(EnumType.STRING)
    private InterestType type;

    @OneToMany(mappedBy = "interest")
    private List<InterestDetail> interestDetails;
}
