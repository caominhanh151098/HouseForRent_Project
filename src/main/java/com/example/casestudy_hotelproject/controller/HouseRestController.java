package com.example.casestudy_hotelproject.controller;

import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.Location;
import com.example.casestudy_hotelproject.service.bed.BedRequest;
import com.example.casestudy_hotelproject.service.bed.BedRespone;
import com.example.casestudy_hotelproject.service.category_hotel.request.TypeRoomAndCategoryRequest;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowComfortableDetailResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowDetailListComfortableResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.request.HouseRequest;
import com.example.casestudy_hotelproject.service.house.request.StringRequest;
import com.example.casestudy_hotelproject.service.house.response.HouseOfHostReponse;
import com.example.casestudy_hotelproject.service.house.response.ShowHouseDetailResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseForAdminResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.image.response.ListIDRespone;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowMiniReviewResponse;
import com.example.casestudy_hotelproject.service.rule.RuleService;
import com.example.casestudy_hotelproject.service.rule.response.ShowRuleDetailResponse;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/house")
@CrossOrigin(origins = "http://localhost:3000")
public class HouseRestController {
    private final HouseService houseService;
    private final ComfortableService comfortableService;
    private final ReviewService reviewService;
    private final RuleService ruleService;


    @GetMapping
    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        return houseService.showDisplayHome(pageable);
    }
    @PostMapping
    public void createHouse(@RequestBody HouseRequest house) {

       houseService.createHouse(house);
    }
    @GetMapping("houseOfHost")
    public List<HouseOfHostReponse> getHouseOfHost(){
        List<HouseOfHostReponse> list=houseService.showHouseOfHost(2);
        return list;
    }
    @GetMapping("/detail/{id}")
    public ShowHouseDetailResponse showDetail(@PathVariable int id) {
        ShowHouseDetailResponse houseResp = houseService.showDetail(id);
        return houseResp;
    }

    @GetMapping("/detail/comfortable/{id}")
    public List<ShowDetailListComfortableResponse> showListComfortable(@PathVariable int id) {
        List<ShowDetailListComfortableResponse> listComfortableResp = comfortableService.showListComfortableByHouseId(id);
        return listComfortableResp;
    }
    @GetMapping("/houseOfHostDetail/{id}")
    public HouseOfHostReponse getHouseOfHostDetail(@PathVariable int id){
        HouseOfHostReponse house = houseService.getHouseOfHostDetail(id);
        return house;
    }

    @GetMapping("/detail/review/{id}")
    public ShowMiniReviewResponse showMiniReview(@PathVariable int id) {
        return houseService.showMiniReview(id);
    }

    @GetMapping("/detail/reviews/{id}")
    public Page<ContentReviewResponse> showReviews(@PathVariable int id,@SortDefault(sort = "reviewDate", direction = Sort.Direction.DESC) @PageableDefault(size = 12) Pageable pageable) {
        return reviewService.showReviews(id, pageable);
    }

    @GetMapping("/detail/rule/{id}")
    public List<ShowRuleDetailResponse> getRule(@PathVariable int id) {
        return ruleService.showRuleByHouse(id);
    }

    @GetMapping("/detail/safety/{id}")
    public List<ShowMiniListComfortableResponse> getSafety(@PathVariable int id) {
        return houseService.showSafetyAndAccommodation(id);
    }

    @GetMapping("/admin")
    Page<ShowListHouseForAdminResponse> showAll(Pageable pageable){
        return houseService.showListHouseForAdmin(pageable);
    }
    @GetMapping("/deleteComfortable/{houseID}/{comfortableID}")
    public void deleteComfortable(@PathVariable int houseID,@PathVariable int comfortableID){
        comfortableService.deleteComfortableDetail(houseID,comfortableID);
    }
    @GetMapping("/addComfortable/{houseID}/{comfortableID}")
    public void addComfortable(@PathVariable int houseID,@PathVariable int comfortableID){
        comfortableService.addComfortableDetail(houseID,comfortableID);
    }
    @PostMapping ("/edit/title/{houseID}")
    public void editTitle (@PathVariable int houseID ,@RequestBody StringRequest title){
        houseService.editTitle(houseID,title.getStringRequest());
    }
    @PostMapping ("/edit/description/{houseID}")
    public void editDescription(@PathVariable int houseID ,@RequestBody StringRequest description){
        houseService.editDescription(houseID,description.getStringRequest());
    }
    @GetMapping ("/edit/quantityOfGuests/{houseID}/{type}")
    public void editQuantityOfGuests(@PathVariable int houseID ,@PathVariable String  type){
        houseService.editQuantityOfGuests(houseID,type) ;
    }
    @PostMapping("/edit/location/{houseID}")
    public void editLocation (@PathVariable int houseID, @RequestBody Location location){
        houseService.editLocation(houseID,location.getAddress(), location.getLatitude(), location.getLongitude());

    }
    @PostMapping("/edit/typeRoomAndCategory/{houseID}")
    public void editTypeRoomAndCategory(@RequestBody TypeRoomAndCategoryRequest request,@PathVariable int houseID){
        houseService.editTypeRoom(houseID,request.getTypeRoom());
        houseService.editCategory(houseID,Integer.parseInt(request.getCategoryHotel()));
    }
    @GetMapping("/edit/quantityRoomBedBath/{houseId}/{room}/{bath}")
    public void editquantityRoomBedBath(@PathVariable int houseId, @PathVariable int room,@PathVariable int bath){
        houseService.editquantityOfRooms(houseId,room);
        houseService.editquantityOfBathrooms(houseId,bath);
    }
    @PostMapping("/edit/chooseImage/{roomId}")
    public void chooseImage(@PathVariable int roomId, @RequestBody ArrayList<Integer> listIDRespone){
       houseService.chooseImage(roomId,listIDRespone);

    }
    @PostMapping("/edit/updateBed/{roomID}")
    public void updateBed (@PathVariable int roomID, @RequestBody ArrayList<BedRequest> bedRequests){
        houseService.updateBed(roomID,bedRequests   );
    }
    @GetMapping("/getImageListUrl/{houseID}")
    public List<ShowImgListResponse> getImgByHouse_id(@PathVariable int houseID){
        return houseService.getImgByHouse_id(houseID);
    }
    @PostMapping("/edit/image/{houseID}")
    public void updateImage(@PathVariable int houseID,@RequestBody ArrayList<String> list){
        houseService.updateImage(houseID,list);
    }
    @GetMapping("/setBookNow/{houseID}")
    public void updateBookNow(@PathVariable int houseID){
        houseService.editBookNow(houseID);
    }
    @GetMapping("/updateRuleBoolen/{houseId}/{ruleId}/{status}")
    public void updateRuleBoolen (@PathVariable int houseId,@PathVariable int ruleId,@PathVariable boolean status){
        houseService.updateRuleBoolen(houseId,ruleId,status);
    }
}
