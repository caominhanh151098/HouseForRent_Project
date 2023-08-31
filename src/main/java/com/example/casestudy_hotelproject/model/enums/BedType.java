package com.example.casestudy_hotelproject.model.enums;

public enum BedType {
    SINGER(1),
    KING(2),
    QUEEN(3),
    BUNK(4),
    SOFA(5);

    private int index;
    private BedType(int index){
        this.index = index;
    }
}
