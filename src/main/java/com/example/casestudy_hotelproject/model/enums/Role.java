package com.example.casestudy_hotelproject.model.enums;

public enum Role {
    HOST(1, "Chủ nhà"),
    GUEST(2, "Khách"),
    ADMIN(3, "Admin");

    private int index;
    private String langVi;
    Role(int index, String langVi){
        this.index = index;
        this.langVi = langVi;
    }

    public String getLangVi() {
        return langVi;
    }
}
