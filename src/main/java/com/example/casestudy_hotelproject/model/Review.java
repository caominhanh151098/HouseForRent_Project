package com.example.casestudy_hotelproject.model;

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
    private User user;
    @ManyToOne
    @JoinColumn(name = "house_Id")
    private House house;

    @Column(columnDefinition = "LONGTEXT")
    private String content;
    private LocalDate reviewDate;

    @OneToOne
    @JoinColumn(name = "review_Point_Id")
    private ReviewPoint reviewPoint;

}
