package com.HappyBites.servlet;

import java.io.IOException;
import java.util.Map;

import com.HappyBites.DAO.OrderItemDAO;
import com.HappyBites.DAO.OrderTableDAO;
import com.HappyBites.DAOImpl.OrderItemDAOImpl;
import com.HappyBites.DAOImpl.OrderTableDAOImpl;
import com.HappyBites.Model.Cart;
import com.HappyBites.Model.CartItem;
import com.HappyBites.Model.OrderItem;
import com.HappyBites.Model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        // Get logged-in user
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Get cart
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart.jsp");
            return;
        }

        // Get payment method
        String paymentMethod = req.getParameter("paymentMethod");

        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            paymentMethod = "Cash";
        }

        // Get restaurant ID
        int restaurantId = (Integer) session.getAttribute("restaurantId");

        // Calculate cart total
        double itemTotal = cart.getTotal();

        // Checkout charges
        double deliveryCharges = 30.00;
        double platformFee = 10.00;
        double gstCharges = itemTotal * 0.08;

        double grandTotal =
                itemTotal
                + deliveryCharges
                + platformFee
                + gstCharges;

        try {

            // =========================================
            // 1. CREATE ORDER TABLE RECORD
            // =========================================

            OrderTable order = new OrderTable();

            order.setUserID(userId);
            order.setTotalAmount(grandTotal);
            order.setStatus("Pending");
            order.setPaymentMethod(paymentMethod);
            order.setRestaurantID(restaurantId);

            OrderTableDAO orderTableDAO =
                    new OrderTableDAOImpl();

            // Get generated OrderID
            int orderID =
                    orderTableDAO.addOrder(order);

            if (orderID == 0) {

                resp.sendRedirect(
                        req.getContextPath()
                        + "/checkout.jsp?error=order"
                );

                return;
            }


            // =========================================
            // 2. SAVE CART ITEMS INTO ORDER ITEM TABLE
            // =========================================

            OrderItemDAO orderItemDAO =
                    new OrderItemDAOImpl();

            for (Map.Entry<Integer, CartItem> entry
                    : cart.getItems().entrySet()) {

                CartItem item = entry.getValue();

                OrderItem orderItem =
                        new OrderItem();

                orderItem.setOrderID(orderID);
                orderItem.setMenuID(item.getMenuId());
                orderItem.setQuantity(item.getQty());

                double total =
                        item.getPrice() * item.getQty();

                orderItem.setItemTotal(total);

                orderItemDAO.addOrderItem(orderItem);
            }


            // =========================================
            // 3. SAVE ORDER ID IN SESSION
            // =========================================

            session.setAttribute(
                    "lastOrderID",
                    orderID
            );

            session.setAttribute(
                    "lastOrderTotal",
                    grandTotal
            );

            session.setAttribute(
                    "lastPaymentMethod",
                    paymentMethod
            );


            // =========================================
            // 4. CLEAR CART
            // =========================================

            session.removeAttribute("cart");
            session.removeAttribute("restaurantId");


            // =========================================
            // 5. GO TO ORDER CONFIRMATION
            // =========================================

            resp.sendRedirect(
                    req.getContextPath()
                    + "/order-confirmation.jsp"
            );

        } catch (Exception e) {

            e.printStackTrace();

            resp.sendRedirect(
                    req.getContextPath()
                    + "/checkout.jsp?error=order"
            );
        }
    }


    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        resp.sendRedirect(
                req.getContextPath()
                + "/checkout.jsp"
        );
    }
}