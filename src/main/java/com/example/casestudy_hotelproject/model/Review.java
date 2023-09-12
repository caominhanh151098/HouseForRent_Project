package com.example.casestudy_hotelproject.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "user_Id")
    @JsonIgnore
    private User user;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    @JsonIgnore
    private House house;

    @Column(columnDefinition = "LONGTEXT")
    private String content;
    private LocalDate reviewDate;

    @OneToOne
    @JoinColumn(name = "review_Point_Id")
    private ReviewPoint reviewPoint;

    private boolean status;
    @Override
    public String toString() {
        return "";
    }
}
