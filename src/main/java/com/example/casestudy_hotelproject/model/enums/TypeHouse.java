package com.example.casestudy_hotelproject.model.enums;

import lombok.Data;

public enum TypeHouse {
    HOUSE("Nhà"),
    APARTMENT("Căn hộ"),
    HOTEL("Khách sạn");

    private String langVI;

    TypeHouse(String langVi) {
        this.langVI = langVi;
    }

    public String getLangVI() {
        return langVI;
    }
}
