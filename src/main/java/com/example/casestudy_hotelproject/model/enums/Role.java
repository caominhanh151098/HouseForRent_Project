package com.example.casestudy_hotelproject.model.enums;

public enum Role {
    STAFF(1),
    LESSOR(2),
    ADMIN(3);

    private int index;
    Role(int index){
        this.index = index;
    }
}
