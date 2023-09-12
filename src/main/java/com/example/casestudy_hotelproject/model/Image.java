package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "house_Id")
    private House house;
    @ManyToOne
    @JoinColumn(name = "room_Id")
    private Room room;
    private String srcImg;
    @Column(columnDefinition = "LONGTEXT")
    private String description;

    @Override
    public String toString() {
        return "";
    }
}
