package com.example.casestudy_hotelproject.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
public class CategoryHotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Column(columnDefinition = "LONGTEXT")
    private String iconUrl;

    @OneToMany(mappedBy = "categoryHotel")
    @JsonIgnore
    private List<House> houses;

    public CategoryHotel(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "";
    }
}
