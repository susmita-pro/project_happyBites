package com.HappyBites.servlet;

import java.io.IOException;

import com.HappyBites.DAOImpl.MenuDAOImpl;
import com.HappyBites.Model.Cart;
import com.HappyBites.Model.CartItem;
import com.HappyBites.Model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.sendRedirect(req.getContextPath() + "/cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        try {

            String action = req.getParameter("action");

            if (action == null || action.trim().isEmpty()) {
                resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Action is missing"
                );
                return;
            }

            Cart cart = (Cart) session.getAttribute("cart");


            // =========================================
            // ADD TO CART
            // =========================================

            if (action.equals("add")) {

                String menuIdString = req.getParameter("menuId");

                if (menuIdString == null || menuIdString.trim().isEmpty()) {

                    resp.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Menu ID is missing"
                    );

                    return;
                }

                int menuId = Integer.parseInt(menuIdString);


                // Get menu details from database
                MenuDAOImpl menuDAOImpl = new MenuDAOImpl();

                Menu menu = menuDAOImpl.getMenu(menuId);


                if (menu == null) {

                    resp.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Menu item not found"
                    );

                    return;
                }


                int restaurantId = menu.getRestaurantID();


                // =========================================
                // CREATE CART IF NOT EXISTS
                // =========================================

                Integer oldRestaurantId =
                        (Integer) session.getAttribute("restaurantId");


                if (cart == null ||
                    oldRestaurantId == null ||
                    oldRestaurantId != restaurantId) {

                    cart = new Cart();

                    session.setAttribute("cart", cart);

                    session.setAttribute(
                        "restaurantId",
                        restaurantId
                    );
                }


                // =========================================
                // QUANTITY
                // =========================================

                int qty = 1;

                String qtyString = req.getParameter("qty");


                if (qtyString != null &&
                    !qtyString.trim().isEmpty()) {

                    try {

                        qty = Integer.parseInt(qtyString);

                    } catch (NumberFormatException e) {

                        qty = 1;
                    }
                }


                if (qty <= 0) {
                    qty = 1;
                }


                // =========================================
                // CREATE CART ITEM
                // =========================================

                CartItem cartItem = new CartItem(
                    menu.getMenuID(),
                    menu.getRestaurantID(),
                    menu.getItemName(),
                    menu.getPrice(),
                    qty
                );


                cart.addItem(cartItem);


                // =========================================
                // IMPORTANT
                // ADD TO CART → CART PAGE
                // =========================================

                resp.sendRedirect(
                    req.getContextPath() + "/cart.jsp"
                );

                return;
            }


            // =========================================
            // INCREASE QUANTITY
            // =========================================

            else if (action.equals("increase")) {

                if (cart == null) {

                    resp.sendRedirect(
                        req.getContextPath() + "/cart.jsp"
                    );

                    return;
                }


                String menuIdString =
                        req.getParameter("menuId");


                if (menuIdString == null ||
                    menuIdString.trim().isEmpty()) {

                    resp.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Menu ID is missing"
                    );

                    return;
                }


                int menuId =
                        Integer.parseInt(menuIdString);


                CartItem item =
                        cart.getItems().get(menuId);


                if (item != null) {

                    int newQty =
                            item.getQty() + 1;

                    cart.updateItem(
                        menuId,
                        newQty
                    );
                }


                resp.sendRedirect(
                    req.getContextPath() + "/cart.jsp"
                );

                return;
            }


            // =========================================
            // DECREASE QUANTITY
            // =========================================

            else if (action.equals("decrease")) {

                if (cart == null) {

                    resp.sendRedirect(
                        req.getContextPath() + "/cart.jsp"
                    );

                    return;
                }


                String menuIdString =
                        req.getParameter("menuId");


                if (menuIdString == null ||
                    menuIdString.trim().isEmpty()) {

                    resp.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Menu ID is missing"
                    );

                    return;
                }


                int menuId =
                        Integer.parseInt(menuIdString);


                CartItem item =
                        cart.getItems().get(menuId);


                if (item != null) {

                    int newQty =
                            item.getQty() - 1;


                    if (newQty <= 0) {

                        cart.removeItem(menuId);

                    } else {

                        cart.updateItem(
                            menuId,
                            newQty
                        );
                    }
                }


                // If cart becomes empty
                if (cart.getItems().isEmpty()) {

                    session.removeAttribute("cart");

                    session.removeAttribute("restaurantId");
                }


                resp.sendRedirect(
                    req.getContextPath() + "/cart.jsp"
                );

                return;
            }


            // =========================================
            // REMOVE ITEM
            // =========================================

            else if (action.equals("remove")) {

                if (cart == null) {

                    resp.sendRedirect(
                        req.getContextPath() + "/cart.jsp"
                    );

                    return;
                }


                String menuIdString =
                        req.getParameter("menuId");


                if (menuIdString != null &&
                    !menuIdString.trim().isEmpty()) {

                    int menuId =
                            Integer.parseInt(menuIdString);

                    cart.removeItem(menuId);
                }


                // If cart becomes empty
                if (cart.getItems().isEmpty()) {

                    session.removeAttribute("cart");

                    session.removeAttribute("restaurantId");
                }


                resp.sendRedirect(
                    req.getContextPath() + "/cart.jsp"
                );

                return;
            }


            // =========================================
            // UPDATE QUANTITY
            // =========================================

            else if (action.equals("update")) {

                if (cart == null) {

                    resp.sendRedirect(
                        req.getContextPath() + "/cart.jsp"
                    );

                    return;
                }


                String menuIdString =
                        req.getParameter("menuId");

                String qtyString =
                        req.getParameter("qty");


                if (menuIdString != null &&
                    qtyString != null) {

                    int menuId =
                            Integer.parseInt(menuIdString);

                    int qty =
                            Integer.parseInt(qtyString);


                    if (qty > 0) {

                        cart.updateItem(
                            menuId,
                            qty
                        );

                    } else {

                        cart.removeItem(menuId);
                    }
                }


                resp.sendRedirect(
                    req.getContextPath() + "/cart.jsp"
                );

                return;
            }


            // =========================================
            // INVALID ACTION
            // =========================================

            else {

                resp.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid cart action"
                );
            }


        } catch (NumberFormatException e) {

            e.printStackTrace();

            resp.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid number parameter"
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                "Error while processing cart",
                e
            );
        }
    }
}