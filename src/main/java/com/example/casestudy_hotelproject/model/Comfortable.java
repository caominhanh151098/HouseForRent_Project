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
public class Comfortable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private boolean popular;
    private boolean configDefault;

    @ManyToOne
    @JoinColumn(name = "comfortableType_Id")
    private ComfortableType type;

    @Column(columnDefinition = "LONGTEXT")
    private String description;

    @Column(name = "icon_path", columnDefinition = "LONGTEXT")
    private String icon;

    @OneToMany(mappedBy = "comfortable")
    @JsonIgnore
    private List<ComfortableDetail> comfortableDetails;
    @Column(name = "icon_path_none_active", columnDefinition = "LONGTEXT")
    private String iconNoneActive;

    public Comfortable(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "";
    }
}
