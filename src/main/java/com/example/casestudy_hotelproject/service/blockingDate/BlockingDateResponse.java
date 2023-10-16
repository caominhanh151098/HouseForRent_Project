package com.example.casestudy_hotelproject.service.blockingDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BlockingDateResponse {
    private  int id;
    private LocalDate blockingDate;

}
