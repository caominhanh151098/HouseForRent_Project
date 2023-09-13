package com.example.casestudy_hotelproject.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Where;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ComfortableDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;
    @ManyToOne
    @JoinColumn(name = "comfortable_Id")
    private Comfortable comfortable;
    private boolean status;



    public ComfortableDetail(House house, Comfortable comfortable, boolean status) {
        this.house = house;
        this.comfortable = comfortable;
        this.status = status;
    }

    @Override
    public String toString() {
        return "";
    }
}
