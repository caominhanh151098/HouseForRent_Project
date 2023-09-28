package com.example.casestudy_hotelproject.service.description.response;

import com.example.casestudy_hotelproject.model.Description;
import com.example.casestudy_hotelproject.repository.DescriptionRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class DescriptionService {
    private  final DescriptionRepository descriptionRepository;
    public Description findById (int id){
        return  descriptionRepository.findById(id);
    }
    public void saveDescription (Description description){
        descriptionRepository.save( description);
    }
}
