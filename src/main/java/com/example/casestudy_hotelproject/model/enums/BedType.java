package com.example.casestudy_hotelproject.model.enums;

public enum BedType {
    Single(1),
    King(2),
    Queen(3),
    Bunk(4),
    Sofa(5);

    private int index;
    private BedType(int index){
        this.index = index;
    }
}
