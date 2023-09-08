package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.IdentityType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class IdentityPaper {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Enumerated(EnumType.STRING)
    private IdentityType type;
    private String srcImgFrontSide;
    private String srcImgBackSide;
}