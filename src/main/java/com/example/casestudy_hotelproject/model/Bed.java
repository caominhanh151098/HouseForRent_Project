package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.BedType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Bed {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "room_Id")
    private Room room;
    private int quantity;
    @Enumerated(EnumType.STRING)
    private BedType type;

    @Override
    public String toString() {
        return "";
    }
}
