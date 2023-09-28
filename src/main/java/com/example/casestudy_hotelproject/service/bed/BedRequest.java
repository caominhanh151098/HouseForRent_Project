package com.example.casestudy_hotelproject.service.bed;

import com.example.casestudy_hotelproject.model.enums.BedType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BedRequest {
    private BedType type;
    private int quantity;
}
