package com.example.casestudy_hotelproject.service.bed;

import com.example.casestudy_hotelproject.model.Bed;
import com.example.casestudy_hotelproject.repository.BedRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class BedService {
    private final BedRepository bedRepository;

    public void deleteBedByRoomId(int room_id){
        bedRepository.deleteByRoomId(room_id);
    }
}
