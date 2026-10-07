<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.HappyBites.DAOImpl.OrderTableDAOImpl"%>
<%@ page import="com.HappyBites.DAOImpl.OrderItemDAOImpl"%>
<%@ page import="com.HappyBites.DAOImpl.MenuDAOImpl"%>
<%@ page import="com.HappyBites.Model.OrderTable"%>
<%@ page import="com.HappyBites.Model.OrderItem"%>
<%@ page import="com.HappyBites.Model.Menu"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Orders - HappyBites</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: #252936;
    color: white;
}


/* =========================
   HEADER
   ========================= */

.header {
    background: #1e222d;
    padding: 18px 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #3b4050;
}

.logo {
    font-size: 28px;
    font-weight: bold;
    color: #ff8066;
}

.header a {
    color: white;
    text-decoration: none;
    margin-left: 25px;
    font-size: 15px;
}

.header a:hover {
    color: #ff8066;
}


/* =========================
   MAIN
   ========================= */

.orders-container {
    width: 90%;
    max-width: 900px;
    margin: 40px auto;
}


/* =========================
   TITLE
   ========================= */

.orders-title {
    margin-bottom: 25px;
}

.orders-title h1 {
    margin: 0 0 8px;
    font-size: 28px;
}

.orders-title p {
    margin: 0;
    color: #9da1ae;
    font-size: 13px;
}


/* =========================
   ORDER CARD
   ========================= */

.order-card {
    background: #303442;
    border: 1px solid #444958;
    border-radius: 12px;
    padding: 22px;
    margin-bottom: 20px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.25);
}


/* =========================
   ORDER HEADER
   ========================= */

.order-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-bottom: 15px;
    border-bottom: 1px solid #454a59;
}

.order-number {
    font-size: 16px;
    font-weight: bold;
}

.order-date {
    font-size: 12px;
    color: #9da1ae;
}


/* =========================
   STATUS
   ========================= */

.status {
    display: inline-block;
    margin-top: 15px;
    padding: 6px 12px;
    border-radius: 20px;
    background: #263f31;
    color: #7ee2a8;
    font-size: 11px;
    font-weight: bold;
}


/* =========================
   ITEMS
   ========================= */

.order-items {
    margin-top: 18px;
}

.order-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 13px 0;
    border-bottom: 1px solid #414656;
}

.order-item:last-child {
    border-bottom: none;
}

.item-name {
    font-size: 14px;
    font-weight: bold;
}

.item-quantity {
    color: #9da1ae;
    font-size: 12px;
    margin-top: 5px;
}

.item-price {
    color: #ff8f85;
    font-weight: bold;
    font-size: 14px;
}


/* =========================
   TOTAL
   ========================= */

.order-total {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #4b4f5d;
}

.total-label {
    font-size: 16px;
    font-weight: bold;
}

.total-price {
    font-size: 20px;
    font-weight: bold;
    color: #ff8f85;
}


/* =========================
   PAYMENT
   ========================= */

.payment-method {
    margin-top: 10px;
    color: #9da1ae;
    font-size: 12px;
}


/* =========================
   EMPTY ORDERS
   ========================= */

.empty-orders {
    background: #303442;
    border: 1px solid #444958;
    border-radius: 12px;
    padding: 60px 30px;
    text-align: center;
}

.empty-icon {
    font-size: 50px;
    margin-bottom: 15px;
}

.empty-orders h2 {
    margin: 0 0 10px;
    font-size: 21px;
}

.empty-orders p {
    color: #9da1ae;
    font-size: 13px;
    margin-bottom: 25px;
}


/* =========================
   BUTTON
   ========================= */

.order-food-btn {
    display: inline-block;
    padding: 12px 25px;
    border-radius: 25px;
    background: #ffb3a7;
    color: #252936;
    text-decoration: none;
    font-size: 13px;
    font-weight: bold;
}

.order-food-btn:hover {
    background: #ff978b;
}


/* =========================
   BACK
   ========================= */

.back-profile {
    display: block;
    text-align: center;
    margin-top: 25px;
    color: #ff9f95;
    text-decoration: none;
    font-size: 13px;
    font-weight: bold;
}

.back-profile:hover {
    color: #ff5733;
}


/* =========================
   RESPONSIVE
   ========================= */

@media (max-width: 600px) {

    .header {
        padding: 18px 20px;
    }

    .orders-container {
        width: 94%;
    }

    .order-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
    }

    .order-item {
        gap: 15px;
    }

}

</style>

</head>


<body>


<!-- =========================
     HEADER
     ========================= -->

<div class="header">

    <div class="logo">
        HappyBites
    </div>

    <div>

        <a href="<%=request.getContextPath()%>/restaurant.jsp">
            Restaurants
        </a>

        <a href="<%=request.getContextPath()%>/cart.jsp">
            Cart
        </a>

    </div>

</div>


<!-- =========================
     ORDERS
     ========================= -->

<div class="orders-container">


    <div class="orders-title">

        <h1>
            My Orders
        </h1>

        <p>
            View your previous HappyBites orders
        </p>

    </div>


<%

    /*
     * GET LOGGED-IN USER ID
     */

    Integer userId =
        (Integer) session.getAttribute("userId");


    /*
     * CREATE DAO OBJECTS
     */

    OrderTableDAOImpl orderTableDAO =
        new OrderTableDAOImpl();

    OrderItemDAOImpl orderItemDAO =
        new OrderItemDAOImpl();

    MenuDAOImpl menuDAO =
        new MenuDAOImpl();


    /*
     * GET ORDERS FOR CURRENT USER
     */

    List<OrderTable> orderList = null;

    if (userId != null) {

        orderList =
            orderTableDAO.getOrdersByUserId(userId);

    }

%>


<%

if (orderList != null && !orderList.isEmpty()) {

    /*
     * DISPLAY ORDERS
     */

    for (OrderTable order : orderList) {

%>


    <!-- =========================
         ORDER CARD
         ========================= -->

    <div class="order-card">


        <!-- ORDER HEADER -->

        <div class="order-header">

            <div class="order-number">

                Order #<%=order.getOrderID()%>

            </div>


            <div class="order-date">

                <%=order.getOrderDate()%>

            </div>

        </div>


        <!-- STATUS -->

        <div class="status">

            <%=order.getStatus()%>

        </div>


        <!-- PAYMENT METHOD -->

        <div class="payment-method">

            Payment:
            <%=order.getPaymentMethod()%>

        </div>


        <!-- ORDER ITEMS -->

        <div class="order-items">


<%

        /*
         * GET ITEMS FOR THIS ORDER
         */

        List<OrderItem> orderItems =
            orderItemDAO.getOrderItemsByOrderId(
                order.getOrderID()
            );


        if (orderItems != null &&
            !orderItems.isEmpty()) {


            for (OrderItem orderItem : orderItems) {


                /*
                 * GET MENU DETAILS
                 */

                Menu menu =
                    menuDAO.getMenu(
                        orderItem.getMenuID()
                    );


                String itemName =
                    "Food Item";


                double itemPrice =
                    orderItem.getItemTotal();


                if (menu != null) {

                    itemName =
                        menu.getItemName();

                }

%>


            <div class="order-item">


                <div>

                    <div class="item-name">

                        🛍️ <%=itemName%>

                    </div>


                    <div class="item-quantity">

                        Quantity:
                        <%=orderItem.getQuantity()%>

                    </div>

                </div>


                <div class="item-price">

                    ₹<%=String.format("%.2f",
                        orderItem.getItemTotal())%>

                </div>


            </div>


<%

            }

        } else {

%>


            <div class="item-quantity">

                No items found for this order.

            </div>


<%

        }

%>


        </div>


        <!-- ORDER TOTAL -->

        <div class="order-total">

            <span class="total-label">

                Total

            </span>


            <span class="total-price">

                ₹<%=String.format("%.2f",
                    order.getTotalAmount())%>

            </span>

        </div>


    </div>


<%

    }

} else {

%>


    <!-- =========================
         NO ORDERS
         ========================= -->

    <div class="empty-orders">

        <div class="empty-icon">
            📦
        </div>


        <h2>

            No Orders Yet

        </h2>


        <p>

            You haven't placed any orders yet.
            Start ordering your favourite food!

        </p>


        <a
            href="<%=request.getContextPath()%>/restaurant.jsp"
            class="order-food-btn">

            Order Food

        </a>

    </div>


<%

}

%>


    <!-- BACK TO PROFILE -->

    <a
        href="<%=request.getContextPath()%>/profile.jsp"
        class="back-profile">

        ← Back to Profile

    </a>


</div>


</body>

</html>