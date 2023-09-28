package com.example.casestudy_hotelproject.model.enums;

public enum TypeFilterComfortable {
    NECESSITIES("Đồ dùng thiết yếu"),

    CHARACTERISTIC("Đặc điểm"),
    SAFE("An toàn");
    private String langVi;

    TypeFilterComfortable(String langVi) {
        this.langVi = langVi;
    }

    public String getLangVi() {
        return langVi;
    }
}
