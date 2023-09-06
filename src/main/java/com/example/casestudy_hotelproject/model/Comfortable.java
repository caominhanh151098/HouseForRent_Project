package com.example.casestudy_hotelproject.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Comfortable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private boolean popular;
    @ManyToOne
    @JoinColumn(name = "comfortableType_Id")
    private ComfortableType type;

    @Column(columnDefinition = "LONGTEXT")
    private String description;

    @Column(name = "icon_path", columnDefinition = "LONGTEXT")
    private String icon;
    @Column(name = "icon_path_none_active", columnDefinition = "LONGTEXT")
    private String iconNoneActive;

    @OneToMany(mappedBy = "comfortable")
    private Set<ComfortableDetail> comfortableDetails;
}
