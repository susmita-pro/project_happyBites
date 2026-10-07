package com.HappyBites.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.HappyBites.DAO.MenuDAO;
import com.HappyBites.DAOImpl.MenuDAOImpl;
import com.HappyBites.Model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get restaurant ID from URL
        String id = request.getParameter("id");

        // Check ID
        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("restaurants.jsp");
            return;
        }

        int restaurantId;

        try {
            restaurantId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.sendRedirect("restaurants.jsp");
            return;
        }

        // Create DAO object
        MenuDAO menuDAO = new MenuDAOImpl();

        // Get menu items from database
        List<Menu> menuList =
                menuDAO.getMenuByRestaurantId(restaurantId);

        // Remove duplicate item names
        Set<String> itemNames = new HashSet<>();

        List<Menu> uniqueMenuList = new ArrayList<>();

        for (Menu menu : menuList) {

            String itemName = menu.getItemName();

            if (itemName != null) {

                itemName = itemName.trim();

                String key = itemName.toLowerCase();

                if (!itemNames.contains(key)) {

                    itemNames.add(key);

                    uniqueMenuList.add(menu);
                }
            }
        }

        // Send menu list to JSP
        request.setAttribute("menuList", uniqueMenuList);

        // Send restaurant ID to JSP
        request.setAttribute("restaurantId", restaurantId);

        // Open menu.jsp
        RequestDispatcher rd =
                request.getRequestDispatcher("menu.jsp");

        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}