package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class FavoritesList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @OneToMany(mappedBy = "list", cascade = CascadeType.ALL)
    private List<Favorite> favoriteList;

    @ManyToOne
    @JoinColumn(name = "user_Id")
    private User user;
    @Override
    public String toString() {
        return "";
    }
}
