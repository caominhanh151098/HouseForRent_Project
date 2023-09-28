package com.example.casestudy_hotelproject.service.location.response;

import com.example.casestudy_hotelproject.model.Location;
import com.example.casestudy_hotelproject.repository.LocationRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class LocationService {
    private final LocationRepository locationRepository;
    public Location findById (int id ){
       return locationRepository.findById(id);
    }
    public void saveLocation(Location location){
        locationRepository.save(location);
    }
}
