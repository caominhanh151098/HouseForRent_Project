package com.example.casestudy_hotelproject.service.room;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Room;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.repository.RoomRepository;
import com.example.casestudy_hotelproject.service.house.HouseService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class RoomService {
    private final RoomRepository roomRepository;
    private final HouseRepository houseRepository;
    public List<Room> findRoomByHouseID(int houseID){
        return  roomRepository.findAllByHouse_Id(houseID);
    }
    public void createRoom(int houseID ){
        House house=houseRepository.findById(houseID);
        Room room=new Room(house);
        roomRepository.save(room);
    }
    public void deleteRoom(Room room){
        roomRepository.delete(room);
    }
    public void save(Room room){
        roomRepository.save(room);
    }
    public Room findById(int id){
       return roomRepository.findById(id);
    }
}
