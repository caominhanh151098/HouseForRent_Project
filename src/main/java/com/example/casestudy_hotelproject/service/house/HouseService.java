package com.example.casestudy_hotelproject.service.house;

import com.example.casestudy_hotelproject.model.*;
import com.example.casestudy_hotelproject.model.enums.*;
import com.example.casestudy_hotelproject.repository.*;
import com.example.casestudy_hotelproject.service.cancellation_policy.response.ShowCancellationPolicyListResponse;
import com.example.casestudy_hotelproject.service.cancellation_policy.response.ShowCancellationPolicyResponse;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowComfortableDetailResponse;
import com.example.casestudy_hotelproject.service.location.response.ShowLocationListHouseResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowPriceAndFeeByHouseResponse;
import com.example.casestudy_hotelproject.service.ShowBedDetailResponse;
import com.example.casestudy_hotelproject.service.bed.BedRequest;
import com.example.casestudy_hotelproject.service.house.response.*;
import com.example.casestudy_hotelproject.service.image.response.ShowImgListResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowFeeByHouseResponse;
import com.example.casestudy_hotelproject.service.reservation.response.ShowFeeResponse;
import com.example.casestudy_hotelproject.service.bed.BedService;
import com.example.casestudy_hotelproject.service.category_hotel.CategoryHotelService;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.comfortable.response.ComfortableDetailRespone;
import com.example.casestudy_hotelproject.service.comfortable.response.ComfortableRespone;
import com.example.casestudy_hotelproject.service.comfortable.response.ShowMiniListComfortableResponse;
import com.example.casestudy_hotelproject.service.description.response.DescriptionService;
import com.example.casestudy_hotelproject.service.house.request.HouseRequest;
import com.example.casestudy_hotelproject.service.location.response.LocationService;
import com.example.casestudy_hotelproject.service.review.response.ContentReviewResponse;
import com.example.casestudy_hotelproject.service.review.response.ShowMiniReviewResponse;
import com.example.casestudy_hotelproject.service.room.RoomService;
import com.example.casestudy_hotelproject.service.room.ShowRoomDetailResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.service.user.response.ShowHostInfoResponse;
import com.example.casestudy_hotelproject.util.AppUtils;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;


@Service
@AllArgsConstructor
public class HouseService {
    private final HouseRepository houseRepository;
    private final ComfortableRepository comfortableRepository;
    private final ComfortableService comfortableService;
    private final ReviewRepository reviewRepository;
    private final ComfortableDetailRepository comfortableDetailRepository;
    private final ImageRepository imageRepository;
    private final DescriptionService descriptionService;
    private final CategoryHotelService categoryHotelService;
    private final LocationService locationService;
    private final RoomService roomService;
    private final BedService bedService;
    private final BedRepository bedRepository;
    private final RoomRepository roomRepository;
    private final RuleHouseRepository ruleHouseRepository;
    private final RuleRepository ruleRepository;
    private final UserRepository userRepository;
    private final UserService userService;
    private final SurchargeRepository surchargeRepository;
    private final CancellationPolicyListRepository cancellationPolicyListRepository;
    private final CancellationPolicyDetailRepository cancellationPolicyDetailRepository;

    public Page<ShowListHouseResponse> showDisplayHome(Pageable pageable) {
        Page<House> listHouse = houseRepository.findAllInHomePage(pageable);

        Page<ShowListHouseResponse> listPageHouse = listHouse.map(e -> AppUtils.mapper.map(e, ShowListHouseResponse.class));
        for (int index = 0; index < listPageHouse.getContent().size(); index++) {
            House house = listHouse.getContent().get(index);
            ShowListHouseResponse houseResp = listPageHouse.getContent().get(index);
            String typeHouse = house.getCategoryHotel().getName();
            String addressHouse = house.getLocation().getAddress();
            listPageHouse.getContent().get(index).setTitle(String.format("%s Tại %s", typeHouse, addressHouse));
            int numReview = house.getReviews().size();
            if (numReview > 1)
                houseResp.setReview(String.format("%s (%s)", house.getAvgReviewPoint(), numReview));
            else houseResp.setReview("Mới");
//            List<ComfortableDetail> comfortableDetails = comfortableDetailRepository.findAllByHouse_Id(house.getId());
//            List<ShowComfortableDetailResponse> showComfortableDetailResponses = comfortableDetails.stream()
//                    .map(comfortableDetail -> AppUtils.mapper.map(comfortableDetail.getComfortable(), ShowComfortableDetailResponse.class))
//                    .collect(Collectors.toList());
//            houseResp.setComfortables(showComfortableDetailResponses);
        }

        return listPageHouse;
    }
    public Page<ShowListHouseResponse> showListHouseResponsePage(Pageable pageable){
        List<HouseDetailResponse> listHouse = houseRepository.findAllWithImage();

        List<ShowListHouseResponse> houseResponses = new ArrayList<>();
        for (int index = 0; index < listHouse.size(); index++) {
            HouseDetailResponse house = listHouse.get(index);
            ShowListHouseResponse houseResp = new ShowListHouseResponse();
            houseResp.setQuantityOfBeds(house.getQuantity_Of_Beds());
            houseResp.setId(house.getId());
            houseResp.setQuantityOfBathrooms(house.getQuantity_Of_Bathrooms());
            houseResp.setLocation(new ShowLocationListHouseResponse(house.getAddress(), house.getLongitude(), house.getLatitude()));
            houseResp.setPrice(house.getPrice());
            houseResp.setHotelName(house.getHotel_Name());
            houseResp.setImages(Arrays.stream(house.getImgs().split(" ")).map(e -> new ShowImgListResponse(e, null)).collect(Collectors.toList()));
            String typeHouse = house.getCategory_House_Name();
            String addressHouse = house.getAddress();
            houseResp.setTitle(String.format("%s Tại %s", typeHouse, addressHouse));
            int numReview = house.getCount_Review();
            if (numReview > 1)
                houseResp.setReview(String.format("%s (%s)", house.getAvg_Review_Point(), numReview));
            else houseResp.setReview("Mới");
            houseResponses.add(houseResp);
//            List<ComfortableDetail> comfortableDetails = comfortableDetailRepository.findAllByHouse_Id(house.getId());
//            List<ShowComfortableDetailResponse> showComfortableDetailResponses = comfortableDetails.stream()
//                    .map(comfortableDetail -> AppUtils.mapper.map(comfortableDetail.getComfortable(), ShowComfortableDetailResponse.class))
//                    .collect(Collectors.toList());
//            houseResp.setComfortables(showComfortableDetailResponses);
        }

        return new PageImpl<>(houseResponses);
    }

    public List<HouseOfHostReponse> showHouseOfHost() {
        User user = userService.getCurrentUser();

        List<House> houseList = houseRepository.findByUser_Id(user.getId());
        List<HouseOfHostReponse> reponseList = houseList.stream().map(e -> AppUtils.mapper.map(e, HouseOfHostReponse.class)).collect(Collectors.toList());
        return reponseList;
    }


    public void createHouse(HouseRequest houseRequest) {
        User user = userService.getCurrentUser();
        if (user.getRole() == Role.GUEST) {

            user.setRole(Role.HOST);
            userRepository.save(user);
        }
        House house = AppUtils.mapper.map(houseRequest, House.class);
        house.setDescription(new Description(houseRequest.getDescriptions()));
        house.setCategoryHotel(new CategoryHotel(Integer.parseInt(houseRequest.getCategoryHotel())));
        house.setLocation(new Location(houseRequest.getAddress(), Double.parseDouble(houseRequest.getLon()), Double.parseDouble(houseRequest.getLat())));
        List<Image> images = new ArrayList<>();
        for (var item : houseRequest.getImageList()
        ) {
            images.add(new Image(house, item));
        }
        house.setImages(images);
        house.setStatus(StatusHouse.WAITING);

        house.setUser(user);
        house.setCreateDate(LocalDate.now());
        houseRepository.save(house);
        saveDefaultCancellationPolicyForHouse(house);
        for (var item : houseRequest.getComfortableDetailList()
        ) {
            comfortableService.createComfortableDetail(new ComfortableDetail(house, new Comfortable(Integer.parseInt(item)), true));
        }
    }

    public void saveDefaultCancellationPolicyForHouse(House house) {
        CancellationPolicyDetail cancellationPolicyDetail = null;
        cancellationPolicyDetail = CancellationPolicyDetail
                .builder()
                .house(house)
                .cancellationPolicyList(cancellationPolicyListRepository.findById(1).orElse(null))
                .build();
        cancellationPolicyDetailRepository.save(cancellationPolicyDetail);
        cancellationPolicyDetail = CancellationPolicyDetail
                .builder()
                .house(house)
                .cancellationPolicyList(cancellationPolicyListRepository.findById(9).orElse(null))
                .build();
        cancellationPolicyDetailRepository.save(cancellationPolicyDetail);
    }

    public HouseOfHostReponse getHouseOfHostDetail(int id) {
        House house = houseRepository.findById(id);
        HouseOfHostReponse houseRespone = AppUtils.mapper.map(house, HouseOfHostReponse.class);
        List<ComfortableDetailRespone> list = new ArrayList<>();
        for (var item : house.getComfortableDetails()
        ) {
            list.add(new ComfortableDetailRespone(new ComfortableRespone(item.getComfortable().getId()), item.isStatus()));
        }
        houseRespone.setComfortableDetails(list);
        return houseRespone;
    }

    public ShowHouseDetailResponse showDetail(int houseId) {
        House house = houseRepository.findById(houseId);

        ShowHouseDetailResponse houseResp = AppUtils.mapper.map(house, ShowHouseDetailResponse.class);
        houseResp.setNumReview(house.getReviews().size());
        if (!house.getRooms().isEmpty())
            houseResp.setRooms(fixInfoRooms(house.getRooms()));

        switch (house.getTypeRoom()) {
            case ENTIRE_PLACE ->
                    houseResp.setTitle(String.format("%s %s", house.getTypeRoom().getLangVi(), house.getCategoryHotel().getName()));
            case SHARED_ROOM ->
                    houseResp.setTitle(String.format("%s tại %s", house.getTypeRoom().getLangVi(), house.getCategoryHotel().getName()));
            case ROOM ->
                    houseResp.setTitle(String.format("%s ở %s", house.getTypeRoom().getLangVi(), house.getCategoryHotel().getName()));
        }
        if (house.getReviews().size() <= 1)
            houseResp.setReviewPoint("Mới");
        else
            houseResp.setReviewPoint(String.valueOf(house.getAvgReviewPoint()));

        String requestDetail = String.format("%s khách. %s phòng ngủ. %s giường. %s phòng tắm",
                house.getQuantityOfGuests(),
                house.getQuantityOfRooms(),
                house.getQuantityOfBeds(),
                house.getQuantityOfBathrooms());
        List<Comfortable> listComfortable = new ArrayList<>();
        for (ComfortableDetail comfortableDetail : house.getComfortableDetails()) {
            listComfortable.add(comfortableDetail.getComfortable());
        }
        List<ShowMiniListComfortableResponse> miniListComfortable = new ArrayList<>();

        for (int index = 0; index < 8 && index < listComfortable.size(); index++) {
            miniListComfortable.add(AppUtils.mapper.map(listComfortable.get(index), ShowMiniListComfortableResponse.class));
        }
        List<ShowMiniListComfortableResponse> safeList = showSafetyAndAccommodation(houseId);
        for (int index = 0; index < safeList.size(); index++) {
            if (safeList.get(index).isStatic_comfortable() == false) {
                miniListComfortable.add(safeList.get(index));
            } else {
                if (miniListComfortable.size() < listComfortable.size()) {
                    miniListComfortable.add(AppUtils.mapper.map(listComfortable.get(listComfortable.size() - 1), ShowMiniListComfortableResponse.class));
                }
            }
        }

        houseResp.setMiniListComfortable(miniListComfortable);
        houseResp.setTitle(String.format("%s. Chủ nhà %s", houseResp.getTitle(), house.getUser().getLastName()));
        houseResp.setRequestDetail(requestDetail);
        houseResp.setNumComfortable(listComfortable.size());
        List<ShowCancellationPolicyListResponse> cancellationPolicyListResponseList = new ArrayList<>();
        house.getCancellationPolicyDetailList().forEach(cp -> {
            ShowCancellationPolicyListResponse cancelListResponse = ShowCancellationPolicyListResponse
                    .builder()
                    .noRefunds(cp.getCancellationPolicyList().isNoRefunds())
                    .type(String.valueOf(cp.getCancellationPolicyList().getType()))
                    .typeRefundShortTerm(String.valueOf(cp.getCancellationPolicyList().getTypeRefundShortTerm()))
                    .cancellationPolicy(AppUtils.mapper.map(cp.getCancellationPolicyList().getCancellationPolicy(), ShowCancellationPolicyResponse.class))
                    .build();

            cancellationPolicyListResponseList.add(cancelListResponse);
        });
        houseResp.setCancellationPolicyDetailList(cancellationPolicyListResponseList);

        return houseResp;
    }

    private boolean checkComfortable(List<Comfortable> listComfortable1, Comfortable comfortable) {
        if (listComfortable1.contains(comfortable))
            return true;
        return false;
    }

    private List<ShowRoomDetailResponse> fixInfoRooms(List<Room> rooms) {
        return rooms.stream().map(room -> {
            List<String> stringBedsDetail = new ArrayList();
            List<ShowBedDetailResponse> bedDetail = new ArrayList<>();
            String srcImg = !room.getImages().isEmpty() ? room.getImages().get(0).getSrcImg() : null;
            for (Bed bed : room.getBeds()) {
                stringBedsDetail.add(String.format("%s %s", bed.getQuantity(), bed.getType().getLangVi()));
                bedDetail.add(new ShowBedDetailResponse(bed.getType().getIconPath(), bed.getQuantity()));
            }
            String beds = String.join(", ", stringBedsDetail);
            return new ShowRoomDetailResponse(room.getName(), srcImg, beds, bedDetail);
        }).collect(Collectors.toList());
    }

    public List<House> getHouseOfHost(int id) {
        List<House> list = houseRepository.findByUser_Id(id);
        return list;
    }

    public ShowMiniReviewResponse showMiniReview(int idHouse) {
        House house = houseRepository.findById(idHouse);

        ShowMiniReviewResponse reviewResp = AppUtils.mapper.map(house, ShowMiniReviewResponse.class);
        reviewResp.setReviews(reviewRepository.getMiniReview(idHouse)
                .stream()
                .map(r -> AppUtils.mapper.map(r, ContentReviewResponse.class))
                .collect(Collectors.toList()));
        return reviewResp;
    }


    public Page<ShowListHouseForAdminResponse> showListHouseForAdmin(String search, Pageable pageable) {
        search = "%" + search + "%";

        Page<ShowListHouseForAdminResponse> responses = houseRepository.findAllHouseForAdminWithStatusWaiting(pageable, search)
                .map(e -> {
                    List<Image> images = imageRepository.findAllByHouse_Id(e.getId());

                    List<ShowListHouseForAdminResponse.ShowImgListResponseForAdmin> imgResponse = images.stream()
                            .map(i -> {
                                ShowListHouseForAdminResponse.ShowImgListResponseForAdmin img
                                        = AppUtils.mapper.map(i, ShowListHouseForAdminResponse.ShowImgListResponseForAdmin.class);
                                try {
                                    if (roomRepository.findById(i.getRoom().getId()) != null) {
                                        Room room = roomRepository.findById(i.getRoom().getId());
                                        img.setName(room.getName());
                                    }
                                } catch (NullPointerException nullPointerException) {
                                    nullPointerException.getMessage();
                                }

                                return img;
                            }).toList();

                    List<ComfortableDetail> comfortableDetails = comfortableDetailRepository.findAllByHouse_Id(e.getId());

                    List<ShowListHouseForAdminResponse.ComfortableResponseForAdmin> comfortableResponseForAdmins = comfortableDetails.stream()
                            .map(c -> {
                                ShowListHouseForAdminResponse.ComfortableResponseForAdmin resp
                                        = AppUtils.mapper.map(c.getComfortable(), ShowListHouseForAdminResponse.ComfortableResponseForAdmin.class);
                                return resp;
                            }).toList();

                    ShowListHouseForAdminResponse house = AppUtils.mapper.map(e, ShowListHouseForAdminResponse.class);

                    house.setImages(imgResponse);
                    house.setComfortableList(comfortableResponseForAdmins);
                    return house;
                });

        Page<ShowListHouseForAdminResponse> a = responses;

        return responses;
    }

    public List<ShowMiniListComfortableResponse> showSafetyAndAccommodation(int houseId) {
        List<ShowMiniListComfortableResponse> safetyListResp = new ArrayList<>();
        Comfortable[] comfortable = new Comfortable[2];
        comfortable[0] = comfortableRepository.findByName("Máy báo khói");
        comfortable[1] = comfortableRepository.findByName("Máy phát hiện khí CO");

        for (Comfortable com : comfortable) {
            ShowMiniListComfortableResponse comfortableResponse = AppUtils.mapper.map(com, ShowMiniListComfortableResponse.class);
            ComfortableDetail comfortableDetail = comfortableDetailRepository.findByComfortable_IdAndHouse_Id(com.getId(), houseId);
            if (comfortableDetail == null || comfortableDetail.isStatus() == false) {
                comfortableResponse.setIcon(com.getIconNoneActive());
                comfortableResponse.setStatic_comfortable(false);
            }
            safetyListResp.add(comfortableResponse);
        }
        return safetyListResp;
    }

    public void editTitle(int houseID, String title) {
        House house = houseRepository.findById(houseID);
        house.setHotelName(title);
        houseRepository.save(house);
    }

    public void editDescription(int houseID, String description) {
        House house = houseRepository.findById(houseID);
        Description description1 = descriptionService.findById(house.getDescription().getId());
        description1.setListingDescription(description);
        descriptionService.saveDescription(description1);
    }

    public void editQuantityOfGuests(int houseID, String type) {
        House house = houseRepository.findById(houseID);
        if (Objects.equals(type, "c")) {
            house.setQuantityOfGuests(house.getQuantityOfGuests() + 1);
        }
        if (Objects.equals(type, "t")) {
            house.setQuantityOfGuests(house.getQuantityOfGuests() - 1);
        }
        houseRepository.save(house);
    }

    public void editCategory(int houseID, int categoryID) {
        House house = houseRepository.findById(houseID);
        CategoryHotel categoryHotel = categoryHotelService.findById(categoryID);
        house.setCategoryHotel(categoryHotel);
        houseRepository.save(house);
    }

    public void editTypeRoom(int houseID, TypeRoom typeRoom) {
        House house = houseRepository.findById(houseID);
        house.setTypeRoom(typeRoom);
        houseRepository.save(house);

    }

    public void editquantityOfRooms(int houseID, int quantityOfRooms) {
        House house = houseRepository.findById(houseID);
        house.setQuantityOfRooms(quantityOfRooms);
        houseRepository.save(house);
        editRoom(houseID, quantityOfRooms);
    }

    public void editquantityOfBathrooms(int houseID, int quantityOfBathrooms) {
        House house = houseRepository.findById(houseID);
        house.setQuantityOfBathrooms(quantityOfBathrooms);
        houseRepository.save(house);
    }

    public void editquantityOfBeds(int houseID, int quantityOfBeds) {
        House house = houseRepository.findById(houseID);
        house.setQuantityOfBeds(quantityOfBeds);
        houseRepository.save(house);

    }

    public void editLocation(int houseID, String address, Double lat, Double lon) {
        House house = houseRepository.findById(houseID);
        Location location = house.getLocation();
        location.setAddress(address);
        location.setLatitude(lat);
        location.setLongitude(lon);
        locationService.saveLocation(location);
    }

    @Transactional
    public void editRoom(int houseID, int quantityRoom) {
        List<Room> rooms = roomService.findRoomByHouseID(houseID);
        List<Room> newList = new ArrayList<>();
        if (quantityRoom > rooms.size()) {
            for (int i = 0; i < quantityRoom - rooms.size(); i++) {
                roomService.createRoom(houseID);
            }
        } else if (quantityRoom < rooms.size()) {
            for (int i = 0; i < quantityRoom; i++) {
                newList.add(rooms.get(i));
            }
            for (int i = 0; i < rooms.size(); i++) {
                List<Image> a = rooms.get(i).getImages();
                for (var item : a
                ) {
                    item.setRoom(null);
                    imageRepository.save(item);
                }
                if (rooms.get(i).getBeds().size() > 0) {
                    bedRepository.deleteAll(rooms.get(i).getBeds());
                    rooms.get(i).setBeds(new ArrayList<>());
                }

            }
            for (int i = 0; i < rooms.size(); i++) {
                roomService.deleteRoom(rooms.get(i));
            }
            for (var item : newList
            ) {
                roomService.save(item);
            }
        }
    }

    public void chooseImage(int roomID, ArrayList<Integer> list) {
        Room room = roomService.findById(roomID);
        List<Image> a = room.getImages();
        for (var item : a
        ) {
            item.setRoom(null);
            imageRepository.save(item);
        }
        for (int item : list
        ) {
            Image image = imageRepository.findById(item);
            image.setRoom(room);
            imageRepository.save(image);
        }
    }

    @Transactional
    public void updateBed(int roomID, ArrayList<BedRequest> list) {
        Room room = roomService.findById(roomID);
        bedRepository.deleteByRoomId(roomID);
        for (var item : list
        ) {
            if (item.getQuantity() > 0) {
                Bed bed = new Bed(room, item.getQuantity(), item.getType());
                bedRepository.save(bed);
            }
        }
    }

    public List<ShowImgListResponse> getImgByHouse_id(int houseID) {
        List<Image> list = imageRepository.findAllByHouse_Id(houseID);
        List<ShowImgListResponse> listResponses = list.stream().map(e -> AppUtils.mapper.map(e, ShowImgListResponse.class)).collect(Collectors.toList());
        return listResponses;
    }

    @Transactional
    public void updateImage(int houseID, ArrayList<String> listImage) {
        House house = houseRepository.findById(houseID);
        imageRepository.deleteByHouseId(houseID);
        for (var item : listImage
        ) {
            Image newImage = new Image(house, item);
            imageRepository.save(newImage);
        }
    }

    public void editBookNow(int houseID) {
        House house = houseRepository.findById(houseID);
        Boolean bookNow = house.isBookNow();
        house.setBookNow(!bookNow);
        houseRepository.save(house);
    }

    @Transactional
    public void updateRuleBoolen(int houseID, int ruleId, Boolean status) {

        RuleHouse ruleHouse = ruleHouseRepository.findByHouseIdAndRuleId(houseID, ruleId);
        if (ruleHouse == null) {
            RuleHouse ruleHouse1 = new RuleHouse(houseRepository.findById(houseID), ruleRepository.findById(ruleId), status);
            ruleHouseRepository.save(ruleHouse1);
        } else if (ruleHouse.isStatus() != status) {
            ruleHouse.setStatus(status);
            ruleHouseRepository.save(ruleHouse);
        }
    }

    public ShowHostInfoResponse getHostInfo(int houseId) {
        User host = userRepository.findUserByHouseId(houseId);
        ShowHostInfoResponse hostResp = AppUtils.mapper.map(host, ShowHostInfoResponse.class);
        hostResp.setNumReview(reviewRepository.countReviewByUser(host.getId()));
        hostResp.setConfirmIdentity(host.getIdentity() != null ? true : false);
        hostResp.setCreateDate(String.format("Đã tham gia vào tháng %s năm %s", host.getCreateDate().getMonthValue(), host.getCreateDate().getYear()));
        return hostResp;
    }

    public ShowPriceAndFeeByHouseResponse showPriceAndFeeByHouse(int houseId) {
        House house = houseRepository.findById(houseId);
        ShowPriceAndFeeByHouseResponse houseResp = AppUtils.mapper.map(house, ShowPriceAndFeeByHouseResponse.class);
        List<Surcharge> surchargeList = surchargeRepository.findAll();
        ShowFeeByHouseResponse feeResp = null;

        for (int i = 0; i < surchargeList.size(); i++) {
            Surcharge surcharge = surchargeList.get(i);
            BookingFeeType bookingFeeType
                    = surcharge.getType() ==
                    SurchargeType.SERVICE_FEE ? BookingFeeType.SERVICE_FEE : BookingFeeType.TAX;

            feeResp = ShowFeeByHouseResponse.builder()
                    .fee(new ShowFeeResponse(surcharge.getName(), bookingFeeType))
                    .price(BigDecimal.valueOf(surcharge.getPercent()))
                    .other(1)
                    .build();
            houseResp.getFeeHouses().add(feeResp);
        }

        return houseResp;
    }

    public List<House> getHousesByCity(String city) {
        return houseRepository.findHousesByCity("%" + city + "%");
    }

    public List<HouseRevenueResponse> getNameHouseByHostId() {
        User user = userService.getCurrentUser();
        List<House> houseList = houseRepository.findByUser_Id(user.getId());
        List<HouseRevenueResponse> houseRevenueResponses = houseList.stream().map(e -> AppUtils.mapper.map(e, HouseRevenueResponse.class)).collect(Collectors.toList());
        return houseRevenueResponses;
    }

    public List<ShowHouseCreateDateAdminResponse> showHouseCreateDateAdminResponses(int month, int year) {
        List<ShowHouseCreateDateAdminResponse> responses = houseRepository.findAllHouseForAdminWithMonthAndYear(month, year)
                .stream().map(e -> AppUtils.mapper.map(e, ShowHouseCreateDateAdminResponse.class)).toList();

        return responses;
    }

    public List<ShowStatisticalHouseForAdminResponse> showStatisticalHouseForAdminResponses(String date1, String date2) {
        LocalDate newDate1 = LocalDate.parse(date1);
        LocalDate newDate2 = LocalDate.parse(date2);

        List<ShowStatisticalHouseForAdminResponse> responses = houseRepository.findAllHouseWithDate(newDate1, newDate2)
                .stream().map(e -> AppUtils.mapper.map(e, ShowStatisticalHouseForAdminResponse.class)).toList();
        return responses;
    }

    @Transactional
    public void updateStatusAdmin(String id, String status, String pdf) {
        int newId = Integer.parseInt(id);
        House house = houseRepository.findById(newId);
        house.setStatus(StatusHouse.valueOf(status));
        house.setConfirmPDF(pdf);

        houseRepository.save(house);
    }

    public Page<ShowListHouseAcceptAdminResponse> showAllAcceptHouse(Pageable pageable, String search) {
        search = "%" + search + "%";

        Page<ShowListHouseAcceptAdminResponse> responses = houseRepository.findAllHouseAdminStatusAccept(pageable, search)
                .map(e -> AppUtils.mapper.map(e, ShowListHouseAcceptAdminResponse.class));
        return responses;
    }

    public PriceResponse getPrice(int houseId) {
        House house = houseRepository.findById(houseId);
        PriceResponse priceResponse = AppUtils.mapper.map(house, PriceResponse.class);
        return priceResponse;
    }

    public void editPrice(int houseId, BigDecimal price) {
        House house = houseRepository.findById(houseId);
        house.setPrice(price);
        houseRepository.save(house);
    }

    public void editWeekendPrice(int houseId, BigDecimal price) {
        House house = houseRepository.findById(houseId);
        house.setWeekendPrice(price);
        houseRepository.save(house);
    }

    @Transactional
    public void updateStatusAdmin(String id, String status) {
        House house = houseRepository.findById(Integer.parseInt(id));
        house.setStatus(StatusHouse.valueOf(status));

        houseRepository.save(house);
    }

    public Page<ShowListHouseAcceptAdminResponse> showAllCancelHouse(Pageable pageable, String search) {
        Page<ShowListHouseAcceptAdminResponse> responses = houseRepository.findAllHouseAdminStatusCancel(pageable, "%" + search + "%")
                .map(e -> AppUtils.mapper.map(e, ShowListHouseAcceptAdminResponse.class));

        return responses;
    }
}