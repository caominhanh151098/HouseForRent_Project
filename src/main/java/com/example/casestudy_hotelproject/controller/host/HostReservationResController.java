package com.example.casestudy_hotelproject.controller.host;

import com.example.casestudy_hotelproject.model.GuestDetail;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.favorite.FavoriteService;
import com.example.casestudy_hotelproject.service.guest_detail.response.GuestDetailService;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.reservation.ReservationService;
import com.example.casestudy_hotelproject.service.reservation.request.SaveReservationRequest;
import com.example.casestudy_hotelproject.service.reservation.response.ShowListReservationResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowRevenue;
import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.rule.RuleService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/host/reservation")
@CrossOrigin(origins = "http://localhost:3000")
public class HostReservationResController {
    private final HouseService houseService;
    private final ComfortableService comfortableService;
    private final ReviewService reviewService;
    private final RuleService ruleService;
    private final FavoriteService favoriteService;
    private final HouseRepository houseRepository;
    private final ReservationService reservationService;
    private final GuestDetailService guestDetailService;

    @PostMapping("/create")
    public void saveReservation(@RequestBody SaveReservationRequest request) {
        reservationService.saveNewReservation(request);
    }

    @GetMapping("/willCheckOut")
    public List<ShowListReservationResponse> getReservationWillCheckOut() {
        return reservationService.getReservationWillBooked();
    }

    @GetMapping("/welcoming")
    public List<ShowListReservationResponse> getReservationWelcoming() {
        return reservationService.getReservationWelcoming();
    }

    @GetMapping("/coming")
    public List<ShowListReservationResponse> getReservationComing() {
        return reservationService.getReservationComing();
    }

    @GetMapping("/upcoming")
    public List<ShowListReservationResponse> getReservationUpComing() {
        return reservationService.getReservationUpComing();
    }

    @GetMapping("/waitApproval")
    public List<ShowListReservationResponse> getReservationWaitApproval() {
        return reservationService.getReservationWaitApproval();
    }

    @GetMapping("/delete/{reservationID}")
    public void deleteReservation(@PathVariable int reservationID) {
        reservationService.deleteReservation(reservationID);
    }

    @GetMapping("/accept/{reservationID}")
    public void acceptReservation(@PathVariable int reservationID) {
        reservationService.acceptReservation(reservationID);
    }
    @GetMapping("/getGuestDetail/{reservationID}")
    public GuestDetail getGuestDetail(@PathVariable int reservationID){
        return guestDetailService.getGuestDetail(reservationID);
    }
    @GetMapping("/all/upcoming/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAllUpcoming(@PathVariable LocalDate startDate, @PathVariable LocalDate endDate, Pageable pageable){
        return reservationService.getReservationAllUpcoming(startDate,endDate, pageable);
    }
    @GetMapping("/all/finished/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAllFinished(@PathVariable LocalDate startDate,@PathVariable LocalDate endDate, Pageable pageable){
        return reservationService.getReservationAllFinished(startDate,endDate, pageable);
    }
    @GetMapping("/all/cancel/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAllCancel(@PathVariable LocalDate startDate,@PathVariable LocalDate endDate, Pageable pageable){
        return reservationService.getReservationAllCancel(startDate,endDate, pageable);
    }
    @GetMapping("/all/all/{startDate}/{endDate}")
    public Page<ShowListReservationResponse> getReservationAll(@PathVariable LocalDate startDate, @PathVariable LocalDate endDate, Pageable pageable){
        return reservationService.getReservationAll(startDate,endDate, pageable);
    }
    @GetMapping("/getReservationFinish/{houseId}/{startDate}/{endDate}")
    public Page<ShowRevenue>  getReservationFinish(@PathVariable int houseId, @PathVariable LocalDate startDate, @PathVariable LocalDate endDate, @PageableDefault(size =5 ) Pageable pageable){

        if(houseId==-1){
            return reservationService.getReservationFinishAll(startDate,endDate, pageable);
        }else {
            return  reservationService.getReservationFinishWithHouseID(startDate,endDate, houseId,pageable);
        }
    }
}
