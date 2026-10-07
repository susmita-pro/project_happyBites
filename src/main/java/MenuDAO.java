package com.HappyBites.DAO;

import java.util.List;
import com.HappyBites.Model.Menu;

public interface MenuDAO {

    List<Menu> getMenuByRestaurantId(int restaurantId);

    Menu getMenu(int menuId);
}