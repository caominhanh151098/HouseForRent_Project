package com.example.casestudy_hotelproject.model.enums;

import lombok.Data;

public enum BedType {
    SINGER(1, "M24 4a2 2 0 0 1 2 1.85v7.99l1.85 5.54a3 3 0 0 1 .11.46l.03.24.01.24V30h-2v-2H6v2H4v-9.68a3 3 0 0 1 .09-.71l.06-.23L6 13.84V6a2 2 0 0 1 1.7-1.98l.15-.01L8 4zm2 18H6v4h20zm-1.39-6H7.4l-1.34 4h19.9zM24 6H8v8h3v-4a2 2 0 0 1 1.85-2H19a2 2 0 0 1 2 1.85V14h3zm-5 4h-6v4h6z", "giường đơn"),
    KING(2, "M28 2a2 2 0 0 1 2 1.85v9.99l1.85 5.54a3 3 0 0 1 .11.46l.03.24.01.24V30h-2v-2H2v2H0v-9.68a3 3 0 0 1 .09-.71l.06-.23L2 13.84V4a2 2 0 0 1 1.7-1.98L3.85 2H4zm2 20H2v4h28zm-1.39-6H3.4l-1.34 4h27.9zM28 4H4v10h2v-4a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V14h2zm-13 6H8v4h7zm9 0h-7v4h7z", "giường king"),
    QUEEN(3, "M28 4a2 2 0 0 1 2 1.85v7.99l1.85 5.54a3 3 0 0 1 .11.46l.03.24.01.24V30h-2v-2H2v2H0v-9.68a3 3 0 0 1 .09-.71l.06-.23L2 13.84V6a2 2 0 0 1 1.7-1.98l.15-.01L4 4zm2 18H2v4h28zm-1.39-6H3.4l-1.34 4h27.9zM28 6H4v8h2v-4a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V14h2zm-13 4H8v4h7zm9 0h-7v4h7z", "giường queen"),
    BUNK(4, "M20 0a2 2 0 0 1 2 1.85V6h4V2h2v4.76l1.68 3.37a3 3 0 0 1 .31 1.11l.01.23V30h-2v-2h-6v2h-2v-2H4v2H2V11.47a3 3 0 0 1 .22-1.13l.1-.21L4 6.76V2h2v4h4V2a2 2 0 0 1 1.85-2H12zm0 24H4v2h16zm8 0h-6v2h6zm-8-8H4v6h16zm8 4h-6v2h6zm0-4h-6v2h6zm-8-4H4v2h16zm8 0h-6v2h6zm-1.62-4H5.62l-1 2h22.76zM20 2h-8v4h8z", "giường tầng"),
    SOFA(5, "M24 4a2 2 0 0 1 2 1.85v7.99l1.85 5.54a3 3 0 0 1 .11.46l.03.24.01.24V30h-2v-2H6v2H4v-9.68a3 3 0 0 1 .09-.71l.06-.23L6 13.84V6a2 2 0 0 1 1.7-1.98l.15-.01L8 4zm2 18H6v4h20zm-1.39-6H7.4l-1.34 4h19.9zM24 6H8v8h3v-4a2 2 0 0 1 1.85-2H19a2 2 0 0 1 2 1.85V14h3zm-5 4h-6v4h6z", "giường sofa"),
    COUCH(6 , "M28 2a2 2 0 0 1 2 1.85v9.99l1.85 5.54a3 3 0 0 1 .11.46l.03.24.01.24V30h-2v-2H2v2H0v-9.68a3 3 0 0 1 .09-.71l.06-.23L2 13.84V4a2 2 0 0 1 1.7-1.98L3.85 2H4zm2 20H2v4h28zm-1.39-6H3.4l-1.34 4h27.9zM28 4H4v10h2v-4a2 2 0 0 1 1.85-2H24a2 2 0 0 1 2 1.85V14h2zm-13 6H8v4h7zm9 0h-7v4h7z", "giường đi-văng");

    private int index;
    private String iconPath;
    private String langVi;
    BedType(int index, String iconPath, String langVi){
        this.index = index;
        this.iconPath = iconPath;
        this.langVi = langVi;
    }

    public String getLangVi() {
        return langVi;
    }

    public String getIconPath() {
        return iconPath;
    }
}
