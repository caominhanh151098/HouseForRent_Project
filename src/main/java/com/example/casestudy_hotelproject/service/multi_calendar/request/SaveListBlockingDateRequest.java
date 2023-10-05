package com.example.casestudy_hotelproject.service.multi_calendar.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class SaveListBlockingDateRequest {
    public String idHouse;
    public List<String> listBlocking;
}
