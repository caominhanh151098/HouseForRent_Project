package com.example.casestudy_hotelproject.controller.admin;

import com.example.casestudy_hotelproject.service.reservation.request.ReservationTestRequest;
import com.example.casestudy_hotelproject.service.dataSocket.DataSocketService;
import com.example.casestudy_hotelproject.service.dataSocket.response.DataSocketResponse;
import lombok.AllArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
@AllArgsConstructor
public class WebSocketController {

    private final DataSocketService dataSocketService;
    private final SimpMessagingTemplate messagingTemplate;

    @MessageMapping("/sendData")
    @SendTo("/topic/dataUpdates")
    public DataSocketResponse sendData(ReservationTestRequest request){
        DataSocketResponse response = dataSocketService.processData(request.getId());

        return response;
    }

}
