package com.example.casestudy_hotelproject.service.favoritesList;

import com.example.casestudy_hotelproject.model.Favorite;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.repository.FavoritesListRepository;
import com.example.casestudy_hotelproject.service.favorite.FavoriteService;
import com.example.casestudy_hotelproject.service.user.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
public class FavoritesListService {
    private final UserService userService;
    private final FavoritesListRepository favoritesListRepository;
    private final FavoriteService favoriteService;

    @Transactional
    public void deleteWishList(int wishListId) {
        User user = userService.getCurrentUser();

        favoritesListRepository.removeByIdAndAndUser(wishListId, user);
    }

}
