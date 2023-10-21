package com.example.casestudy_hotelproject.service.favorite;

import com.example.casestudy_hotelproject.model.Favorite;
import com.example.casestudy_hotelproject.model.FavoritesList;
import com.example.casestudy_hotelproject.model.House;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.repository.FavoriteRepository;
import com.example.casestudy_hotelproject.repository.FavoritesListRepository;
import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.favorite.response.ShowCategoryFavoriteListResponse;
import com.example.casestudy_hotelproject.service.favoritesList.response.FavoriteHouseResponse;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.user.UserService;
import com.example.casestudy_hotelproject.util.AppUtils;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class FavoriteService {
    private final HouseRepository houseRepository;
    private final UserService userService;
    private final FavoritesListRepository favoritesListRepository;
    private final FavoriteRepository favoriteRepository;

    public List<ShowCategoryFavoriteListResponse> showCategoryFavoriteList() {
        User user = userService.getCurrentUser();
        List<ShowCategoryFavoriteListResponse> respList = new ArrayList<>();
        user.getFavoritesLists().forEach(fl -> {

            ShowCategoryFavoriteListResponse categoryFavoriteResp = new ShowCategoryFavoriteListResponse().builder()
                    .id(fl.getId())
                    .name(fl.getName())
                    .images(addSrcImgInFavoriteList(fl))
                    .quantityHouse(fl.getFavoriteList().size())
                    .build();
            respList.add(categoryFavoriteResp);
        });

        return respList;
    }

    public Page<ShowListHouseResponse> showWishlist(int wishListId, Pageable pageable) {

        Page<House> houseList = houseRepository.findAllByFavorites(wishListId, pageable);

        Page<ShowListHouseResponse> respList = houseList.map(h -> AppUtils.mapper.map(h, ShowListHouseResponse.class));
        for (int index = 0; index < respList.getContent().size(); index++) {
            House house = houseList.getContent().get(index);
            ShowListHouseResponse houseResp = respList.getContent().get(index);

            String typeHouse = house.getCategoryHotel().getName();
            String addressHouse = house.getLocation().getAddress();
            respList.getContent().get(index).setTitle(String.format("%s Tại %s", typeHouse, addressHouse));
            int numReview = house.getReviews().size();
            if (numReview > 1)
                houseResp.setReview(String.format("%s (%s)", house.getAvgReviewPoint(), numReview));
            else houseResp.setReview("Mới");
        }
        return respList;
    }

    public List<String> addSrcImgInFavoriteList(FavoritesList fl) {
        List<String> srcImages = new ArrayList<>();
        int size = 0;
        int index = 0;
        for (int i = 0; i < fl.getFavoriteList().size() && size < 3; i++) {
            srcImages.add(fl.getFavoriteList().get(i).getHouse().getImages().get(index).getSrcImg());
            size++;
            if (i == fl.getFavoriteList().size() - 1) {
                i--;
                index++;
            }
        }
        return srcImages;
    }

    public void addToWishlist(int idHouse, int idFavoritesList) {
        User user = userService.getCurrentUser();

        user.getFavoritesLists().forEach(fl -> {
            House house = houseRepository.findById(idHouse);
            if (fl.getId() == idFavoritesList && favoriteRepository.findByHouseAndList(house, fl) == null) {
                fl.getFavoriteList().add(new Favorite().builder()
                        .house(house)
                        .list(fl)
                        .build());
            }
            favoritesListRepository.save(fl);
            return;
        });
    }

    @Transactional
    public void removeHouseFavorite(int idHouse) {
        User user = userService.getCurrentUser();

        favoriteRepository.removeByHouse_IdAndList_User(idHouse, user);
    }

    public int createNewWishlist(String nameWishlist) {
        User user = userService.getCurrentUser();

        String cleanedName = nameWishlist.replaceAll("\"", "");
       return favoritesListRepository.save(new FavoritesList().builder().name(cleanedName).user(user).build()).getId();
    }

    public List<Integer> findFavoriteHousesWithLocationByUserId() {
        User user = userService.getCurrentUser();
        return favoriteRepository.findFavoriteHousesWithLocationByUserId(user.getId());
    }
}
