package com.example.casestudy_hotelproject.controller.guest;

import com.example.casestudy_hotelproject.repository.HouseRepository;
import com.example.casestudy_hotelproject.service.comfortable.ComfortableService;
import com.example.casestudy_hotelproject.service.favorite.FavoriteService;
import com.example.casestudy_hotelproject.service.favorite.response.ShowCategoryFavoriteListResponse;
import com.example.casestudy_hotelproject.service.fee.FeeService;
import com.example.casestudy_hotelproject.service.house.HouseService;
import com.example.casestudy_hotelproject.service.house.response.ShowListHouseResponse;
import com.example.casestudy_hotelproject.service.review.ReviewService;
import com.example.casestudy_hotelproject.service.rule.RuleService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/guest/house")
@CrossOrigin(origins = "http://localhost:3000")
public class GuestHouseRestController {
    private final FavoriteService favoriteService;

    @GetMapping("/wishlists")
    public List<ShowCategoryFavoriteListResponse> showCategoryFavoriteList() {
        return favoriteService.showCategoryFavoriteList();
    }

    @GetMapping("/wishlists/{id}")
    public Page<ShowListHouseResponse> showWishlist(@PathVariable int id, Pageable pageable) {
        return favoriteService.showWishlist(id, pageable);
    }

    @PostMapping("/add-house-to-wishlist/{idFavoritesList}/{idHouse}")
    public void addToWishlistByUser(@PathVariable int idHouse, @PathVariable int idFavoritesList) {
        favoriteService.addToWishlist(idHouse, idFavoritesList);
    }

    @DeleteMapping("/remove-house-favorite/{idHouse}")
    public void removeHouseFavorite(@PathVariable int idHouse) {
        favoriteService.removeHouseFavorite(idHouse);
    }

    @PostMapping("/create-wishlist")
    public void createNewWishlist(@RequestBody String nameWishlist) {
        favoriteService.createNewWishlist(nameWishlist);
    }
}
