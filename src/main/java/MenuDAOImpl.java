package com.HappyBites.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.HappyBites.DAO.MenuDAO;
import com.HappyBites.Model.Menu;
import com.HappyBites.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    // =========================================
    // GET MENU BY RESTAURANT ID
    // =========================================

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        String sql = "SELECT * FROM menu WHERE RestaurantID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Menu menu = new Menu();

                menu.setMenuID(rs.getInt("MenuID"));
                menu.setRestaurantID(rs.getInt("RestaurantID"));
                menu.setItemName(rs.getString("ItemName"));
                menu.setDescription(rs.getString("Description"));
                menu.setPrice(rs.getDouble("Price"));
                menu.setImagePath(rs.getString("ImagePath"));

                menuList.add(menu);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return menuList;
    }


    // =========================================
    // GET ONE MENU ITEM BY MENU ID
    // =========================================

    @Override
    public Menu getMenu(int menuId) {

        Menu menu = null;

        String sql = "SELECT * FROM menu WHERE MenuID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                menu = new Menu();

                menu.setMenuID(rs.getInt("MenuID"));
                menu.setRestaurantID(rs.getInt("RestaurantID"));
                menu.setItemName(rs.getString("ItemName"));
                menu.setDescription(rs.getString("Description"));
                menu.setPrice(rs.getDouble("Price"));
                menu.setImagePath(rs.getString("ImagePath"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return menu;
    }
}
