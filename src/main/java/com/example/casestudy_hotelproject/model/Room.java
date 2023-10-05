package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;
    private String name;

    @OneToMany(mappedBy = "room")
    private List<Bed> beds;

    @OneToMany(mappedBy = "room")
    private List<Image> images;

    @Override
    public String toString() {
        return "";
    }

    public Room(House house) {
        this.house = house;
    }
}
