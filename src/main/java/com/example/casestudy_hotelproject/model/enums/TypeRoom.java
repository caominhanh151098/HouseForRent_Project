package com.example.casestudy_hotelproject.model.enums;

public enum TypeRoom {
    ENTIRE_PLACE("Toàn bộ"),
    ROOM("Phòng"),
    SHARED_ROOM("Phòng chung");
    private String langVi;
    TypeRoom(String langVi){
        this.langVi = langVi;
    }

    public String getLangVi() {
        return langVi;
    }
}
