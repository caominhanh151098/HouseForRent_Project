package com.example.casestudy_hotelproject.model.enums;

public enum Role {
    Staff(1),
    Lessor(2),
    Admin(3);

    private int index;
    private Role(int index){
        this.index = index;
    }
}
