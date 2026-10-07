<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.HappyBites.Model.Cart"%>
<%@ page import="com.HappyBites.Model.CartItem"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Cart - HappyBites</title>

<style>

/* =========================
   BODY
   ========================= */

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;

    background-color: #f5f6f8;
    color: #222;
}


/* =========================
   HEADER
   ========================= */

.header {
    background-color: #ff5a67;
    color: white;

    padding: 18px 50px;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 28px;
    font-weight: bold;
    color: white;
}

.header a {
    color: white;

    text-decoration: none;

    margin-left: 25px;

    font-size: 16px;
}

.header a:hover {
    color: #ffe1dc;
}


/* =========================
   MAIN CONTAINER
   ========================= */

.container {
    width: 90%;
    margin: 40px auto;
}


/* =========================
   MY CART TITLE
   ========================= */

h1 {
    margin-bottom: 25px;

    color: #ff5733;
}


/* =========================
   CART HEADER
   ========================= */

.cart-header {
    display: grid;

    grid-template-columns:
        2fr 1fr 1fr 1fr 1fr;

    background-color: #ff5733;

    color: white;

    padding: 15px;

    font-weight: bold;

    border-radius: 8px 8px 0 0;
}


/* =========================
   CART ITEM
   ========================= */

.cart-item {
    display: grid;

    grid-template-columns:
        2fr 1fr 1fr 1fr 1fr;

    background-color: white;

    padding: 20px 15px;

    align-items: center;

    border-bottom: 1px solid #ffd2c8;
}

.cart-item:hover {
    background-color: #fff7f5;
}


/* =========================
   ITEM NAME
   ========================= */

.item-name {
    font-size: 17px;

    font-weight: bold;

    color: #333;
}


/* =========================
   PRICE
   ========================= */

.item-price {
    font-size: 16px;

    color: #ff5733;
}


/* =========================
   QUANTITY
   ========================= */

.quantity-container {
    display: flex;

    align-items: center;

    gap: 10px;
}

.quantity-container form {
    margin: 0;
}


/* =========================
   PLUS / MINUS BUTTON
   ========================= */

.quantity-btn {
    width: 32px;
    height: 32px;

    border: none;

    background-color: #ff5733;

    color: white;

    font-size: 20px;

    border-radius: 5px;

    cursor: pointer;
}

.quantity-btn:hover {
    background-color: #e64a2e;
}


/* =========================
   QUANTITY NUMBER
   ========================= */

.quantity {
    font-size: 17px;

    font-weight: bold;

    color: #333;
}


/* =========================
   ITEM TOTAL
   ========================= */

.item-total {
    font-weight: bold;

    font-size: 16px;

    color: #ff5733;
}


/* =========================
   REMOVE BUTTON
   ========================= */

.remove-btn {
    background-color: #ff5733;

    color: white;

    border: none;

    padding: 9px 15px;

    border-radius: 5px;

    cursor: pointer;
}

.remove-btn:hover {
    background-color: #e64a2e;
}


/* =========================
   BOTTOM SECTION
   ========================= */

.cart-bottom {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-top: 30px;
}


/* =========================
   ADD MORE ITEMS
   ========================= */

.add-more-btn {
    display: inline-block;

    background-color: white;

    color: #ff5733;

    border: 2px solid #ff5733;

    padding: 12px 20px;

    text-decoration: none;

    border-radius: 6px;

    font-weight: bold;
}

.add-more-btn:hover {
    background-color: #ff5733;

    color: white;
}


/* =========================
   GRAND TOTAL
   ========================= */

.cart-total {
    text-align: right;
}

.cart-total h2 {
    margin-bottom: 15px;

    color: #ff5733;
}


/* =========================
   CHECKOUT BUTTON
   ========================= */

.checkout-btn {
    display: inline-block;

    background-color: #ff5733;

    color: white;

    padding: 13px 25px;

    text-decoration: none;

    border-radius: 6px;

    font-weight: bold;

    border: 1px solid #ff5733;
}

.checkout-btn:hover {
    background-color: #e64a2e;

    border-color: #e64a2e;
}


/* =========================
   EMPTY CART
   ========================= */

.empty-cart {
    background-color: white;

    padding: 50px;

    text-align: center;

    border-radius: 8px;

    border: 1px solid #ffd2c8;
}

.empty-cart h2 {
    margin-bottom: 20px;

    color: #ff5733;
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


<%
    Cart cart = (Cart) session.getAttribute("cart");
%>


<!-- =========================
     MAIN
     ========================= -->

<div class="container">


    <h1>
        My Cart 🛒
    </h1>


<%
    if (cart != null && !cart.isEmpty()) {

        double grandTotal = 0;
%>


    <!-- =========================
         CART HEADER
         ========================= -->

    <div class="cart-header">

        <div>Item</div>

        <div>Price</div>

        <div>Quantity</div>

        <div>Total</div>

        <div>Action</div>

    </div>


<%
        for (CartItem item : cart.getItems().values()) {

            grandTotal = grandTotal + item.getTotalPrice();
%>


    <!-- =========================
         CART ITEM
         ========================= -->

    <div class="cart-item">


        <!-- ITEM NAME -->

        <div class="item-name">

            <%=item.getName()%>

        </div>


        <!-- PRICE -->

        <div class="item-price">

            ₹<%=String.format("%.2f", item.getPrice())%>

        </div>


        <!-- =========================
             QUANTITY
             ========================= -->

        <div class="quantity-container">


            <!-- DECREASE -->

            <form action="<%=request.getContextPath()%>/CartServlet"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="decrease">

                <input type="hidden"
                       name="menuId"
                       value="<%=item.getMenuId()%>">

                <button type="submit"
                        class="quantity-btn">

                    −

                </button>

            </form>


            <!-- QUANTITY -->

            <span class="quantity">

                <%=item.getQty()%>

            </span>


            <!-- INCREASE -->

            <form action="<%=request.getContextPath()%>/CartServlet"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="increase">

                <input type="hidden"
                       name="menuId"
                       value="<%=item.getMenuId()%>">

                <button type="submit"
                        class="quantity-btn">

                    +

                </button>

            </form>


        </div>


        <!-- =========================
             ITEM TOTAL
             ========================= -->

        <div class="item-total">

            ₹<%=String.format("%.2f",
                    item.getTotalPrice())%>

        </div>


        <!-- =========================
             REMOVE
             ========================= -->

        <div>

            <form action="<%=request.getContextPath()%>/CartServlet"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="remove">

                <input type="hidden"
                       name="menuId"
                       value="<%=item.getMenuId()%>">

                <button type="submit"
                        class="remove-btn">

                    Remove

                </button>

            </form>

        </div>


    </div>


<%
        }
%>


    <!-- =========================
         BOTTOM SECTION
         ========================= -->

    <div class="cart-bottom">


        <!-- LEFT : ADD MORE -->

        <div>

            <a href="<%=request.getContextPath()%>/restaurant.jsp"
               class="add-more-btn">

                + Add More Items

            </a>

        </div>


        <!-- RIGHT : TOTAL + CHECKOUT -->

        <div class="cart-total">

            <h2>

                Grand Total:
                ₹<%=String.format("%.2f", grandTotal)%>

            </h2>


            <a href="<%=request.getContextPath()%>/checkout.jsp"
               class="checkout-btn">

                Proceed to Checkout

            </a>

        </div>


    </div>


<%
    } else {
%>


    <!-- =========================
         EMPTY CART
         ========================= -->

    <div class="empty-cart">

        <h2>
            Your cart is empty 🛒
        </h2>

        <a href="<%=request.getContextPath()%>/restaurant.jsp"
           class="add-more-btn">

            Browse Restaurants

        </a>

    </div>


<%
    }
%>


</div>


</body>
</html>