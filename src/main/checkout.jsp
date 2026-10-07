<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.HappyBites.Model.Cart"%>
<%@ page import="com.HappyBites.Model.CartItem"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Checkout - HappyBites</title>

<style>

/* =========================
   BODY
   ========================= */

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: #252936;
    color: #ffffff;
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
}

.header a {
    color: white;
    text-decoration: none;
    margin-left: 25px;
    font-size: 16px;
}

.header a:hover {
    color: #ffb3a7;
}


/* =========================
   MAIN CONTAINER
   ========================= */

.checkout-container {
    width: 94%;
    max-width: 1250px;
    margin: 35px auto;
    display: grid;
    grid-template-columns: 1.3fr 0.9fr;
    gap: 25px;
}


/* =========================
   LEFT & RIGHT BOX
   ========================= */

.checkout-box {
    background: #303442;
    border: 1px solid #444958;
    border-radius: 12px;
    padding: 25px;
}


/* =========================
   SECTION TITLE
   ========================= */

.section-title {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 22px;
}

.number {
    width: 30px;
    height: 30px;
    background: #ffb3a7;
    color: #252936;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
}

.section-title h2 {
    margin: 0;
    font-size: 20px;
}


/* =========================
   FORM ROW
   ========================= */

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
    margin-bottom: 17px;
}

.form-group {
    display: flex;
    flex-direction: column;
}


/* =========================
   LABEL
   ========================= */

label {
    font-size: 13px;
    font-weight: bold;
    margin-bottom: 8px;
    color: #eeeeee;
}

.required {
    color: #ff8f85;
}


/* =========================
   INPUT
   ========================= */

input,
textarea {
    width: 100%;
    padding: 13px;
    border-radius: 7px;
    border: 1px solid #464b5c;
    background: #272b38;
    color: white;
    outline: none;
    font-size: 14px;
}

input:focus,
textarea:focus {
    border-color: #ff9f95;
}

input::placeholder,
textarea::placeholder {
    color: #999eac;
}

textarea {
    height: 80px;
    resize: none;
}


/* =========================
   FULL WIDTH
   ========================= */

.full-width {
    margin-bottom: 17px;
}


/* =========================
   SAVE ADDRESS
   ========================= */

.save-address {
    margin-top: 5px;
    margin-bottom: 25px;
}

.save-title {
    font-size: 13px;
    margin-bottom: 10px;
    font-weight: bold;
}

.address-options {
    display: flex;
    gap: 12px;
}

.address-option {
    padding: 9px 18px;
    border-radius: 20px;
    background: #272b38;
    border: 1px solid #454a59;
    color: #ddd;
    cursor: pointer;
    font-size: 13px;
}

.address-option.active {
    background: #ffb3a7;
    color: #252936;
    border-color: #ffb3a7;
}


/* =========================
   PAYMENT
   ========================= */

.payment-title {
    margin-top: 10px;
}

.payment-methods {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px;
}

.payment-card {
    background: #272b38;
    border: 1px solid #464b5c;
    border-radius: 9px;
    padding: 18px;
    cursor: pointer;
    transition: 0.2s;
}

.payment-card:hover {
    border-color: #ff9f95;
}

.payment-card.selected {
    border: 2px solid #ff8f85;
}

.payment-icon {
    font-size: 22px;
    margin-bottom: 8px;
}

.payment-name {
    font-weight: bold;
    margin-bottom: 5px;
}

.payment-description {
    font-size: 12px;
    color: #aeb2bd;
    line-height: 1.4;
}


/* =========================
   ORDER SUMMARY
   ========================= */

.order-item {
    background: #272b38;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.item-info {
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.item-name {
    font-weight: bold;
    font-size: 15px;
}

.item-qty {
    font-size: 12px;
    color: #b5b8c2;
}

.item-price {
    color: #ff8f85;
    font-weight: bold;
}


/* =========================
   BILL DETAILS
   ========================= */

.bill-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
}

.bill-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 13px;
    font-size: 14px;
    color: #d6d8df;
}

.bill-row span:last-child {
    color: #eeeeee;
}


/* =========================
   GRAND TOTAL
   ========================= */

.grand-total {
    border-top: 1px solid #4b4f5d;
    margin-top: 18px;
    padding-top: 18px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.grand-total span:first-child {
    font-size: 19px;
    font-weight: bold;
}

.grand-total span:last-child {
    font-size: 23px;
    font-weight: bold;
    color: #ff8f85;
}


/* =========================
   DELIVERY TIME
   ========================= */

.delivery-time {
    margin-top: 20px;
    background: #272b38;
    border: 1px solid #444958;
    border-radius: 8px;
    padding: 15px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.delivery-icon {
    font-size: 25px;
}

.delivery-text {
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.delivery-text strong {
    font-size: 13px;
}

.delivery-text span {
    font-size: 12px;
    color: #aaaeba;
}


/* =========================
   PLACE ORDER
   ========================= */

.place-order-btn {
    width: 100%;
    margin-top: 20px;
    padding: 15px;
    border: none;
    border-radius: 25px;
    background: #ffb3a7;
    color: #252936;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.place-order-btn:hover {
    background: #ff978b;
}


/* =========================
   BACK TO CART
   ========================= */

.back-cart {
    display: block;
    width: 100%;
    text-align: center;
    margin-top: 12px;
    padding: 12px;
    border: 1px solid #ff8f85;
    border-radius: 25px;
    color: #ff9f95;
    text-decoration: none;
    font-weight: bold;
    font-size: 14px;
}

.back-cart:hover {
    background: #ff8f85;
    color: #252936;
}


/* =========================
   SECURITY
   ========================= */

.security {
    text-align: center;
    margin-top: 15px;
    font-size: 11px;
    color: #9da1ae;
}


/* =========================
   RESPONSIVE
   ========================= */

@media (max-width: 850px) {

    .checkout-container {
        grid-template-columns: 1fr;
    }

    .form-row {
        grid-template-columns: 1fr;
    }

    .payment-methods {
        grid-template-columns: 1fr;
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


<%

    Cart cart = (Cart) session.getAttribute("cart");

    double itemTotal = 0;

    if (cart != null) {
        itemTotal = cart.getTotal();
    }

    double deliveryCharges = 30.00;

    double platformFee = 10.00;

    double gstCharges = itemTotal * 0.08;

    double grandTotal =
            itemTotal
            + deliveryCharges
            + platformFee
            + gstCharges;

%>


<!-- =========================
     ORDER FORM
     ========================= -->

<form action="<%=request.getContextPath()%>/OrderServlet"
      method="post"
      id="orderForm">

    <!-- PAYMENT METHOD VALUE -->
    <input type="hidden"
           name="paymentMethod"
           id="paymentMethod"
           value="UPI">


<!-- =========================
     CHECKOUT CONTAINER
     ========================= -->

<div class="checkout-container">


    <!-- =========================
         LEFT SIDE
         ========================= -->

    <div class="checkout-box">


        <!-- DELIVERY INFORMATION -->

        <div class="section-title">

            <div class="number">
                1
            </div>

            <h2>
                Delivery Information
            </h2>

        </div>


        <!-- NAME + PHONE -->

        <div class="form-row">

            <div class="form-group">

                <label>
                    Full Name
                    <span class="required">*</span>
                </label>

                <input
                    type="text"
                    name="fullName"
                    placeholder="Enter your full name"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Phone Number
                    <span class="required">*</span>
                </label>

                <input
                    type="text"
                    name="phone"
                    placeholder="Enter 10-digit phone number"
                    required>

            </div>

        </div>


        <!-- EMAIL -->

        <div class="form-group full-width">

            <label>
                Email Address
            </label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email address">

        </div>


        <!-- ADDRESS -->

        <div class="form-group full-width">

            <label>
                Complete Address
                <span class="required">*</span>
            </label>

            <textarea
                name="address"
                placeholder="House number, building name, street and area"
                required></textarea>

        </div>


        <!-- CITY + PINCODE -->

        <div class="form-row">

            <div class="form-group">

                <label>
                    City
                    <span class="required">*</span>
                </label>

                <input
                    type="text"
                    name="city"
                    placeholder="Enter city"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Pincode
                    <span class="required">*</span>
                </label>

                <input
                    type="text"
                    name="pincode"
                    placeholder="Enter 6-digit pincode"
                    required>

            </div>

        </div>


        <!-- SAVE ADDRESS -->

        <div class="save-address">

            <div class="save-title">
                Save Address As
            </div>

            <div class="address-options">

                <div
                    class="address-option active"
                    onclick="selectAddress(this)">

                    🏠 Home

                </div>

                <div
                    class="address-option"
                    onclick="selectAddress(this)">

                    💼 Work

                </div>

                <div
                    class="address-option"
                    onclick="selectAddress(this)">

                    📍 Other

                </div>

            </div>

        </div>


        <!-- =========================
             PAYMENT METHOD
             ========================= -->

        <div class="section-title payment-title">

            <div class="number">
                2
            </div>

            <h2>
                Payment Method
            </h2>

        </div>


        <div class="payment-methods">


            <!-- UPI -->

            <div
                class="payment-card selected"
                onclick="selectPayment(this, 'UPI')">

                <div class="payment-icon">
                    📱
                </div>

                <div class="payment-name">
                    UPI Payment
                </div>

                <div class="payment-description">
                    Google Pay, PhonePe, Paytm or other UPI apps
                </div>

            </div>


            <!-- CARD -->

            <div
                class="payment-card"
                onclick="selectPayment(this, 'Card')">

                <div class="payment-icon">
                    💳
                </div>

                <div class="payment-name">
                    Card Payment
                </div>

                <div class="payment-description">
                    Credit card or debit card
                </div>

            </div>


            <!-- CASH ON DELIVERY -->

            <div
                class="payment-card"
                onclick="selectPayment(this, 'Cash')">

                <div class="payment-icon">
                    💵
                </div>

                <div class="payment-name">
                    Cash on Delivery
                </div>

                <div class="payment-description">
                    Pay with cash when your order is delivered
                </div>

            </div>


        </div>


    </div>


    <!-- =========================
         RIGHT SIDE
         ========================= -->

    <div class="checkout-box">


        <!-- ORDER SUMMARY -->

        <div class="section-title">

            <div class="number">
                3
            </div>

            <h2>
                Order Summary
            </h2>

        </div>


<%

    if (cart != null && !cart.isEmpty()) {

        for (CartItem item : cart.getItems().values()) {

%>


        <!-- ITEM -->

        <div class="order-item">

            <div class="item-info">

                <div class="item-name">

                    🛍️ <%=item.getName()%>

                </div>

                <div class="item-qty">

                    Quantity:
                    <%=item.getQty()%>

                </div>

            </div>


            <div class="item-price">

                ₹<%=String.format(
                    "%.2f",
                    item.getTotalPrice()
                )%>

            </div>

        </div>


<%

        }

    }

%>


        <!-- BILL DETAILS -->

        <div class="bill-title">
            Bill Details
        </div>


        <div class="bill-row">

            <span>
                Item Total
            </span>

            <span>
                ₹<%=String.format(
                    "%.2f",
                    itemTotal
                )%>
            </span>

        </div>


        <div class="bill-row">

            <span>
                Delivery Charges
            </span>

            <span>
                ₹<%=String.format(
                    "%.2f",
                    deliveryCharges
                )%>
            </span>

        </div>


        <div class="bill-row">

            <span>
                Platform Fee
            </span>

            <span>
                ₹<%=String.format(
                    "%.2f",
                    platformFee
                )%>
            </span>

        </div>


        <div class="bill-row">

            <span>
                GST and Restaurant Charges
            </span>

            <span>
                ₹<%=String.format(
                    "%.2f",
                    gstCharges
                )%>
            </span>

        </div>


        <!-- GRAND TOTAL -->

        <div class="grand-total">

            <span>
                Grand Total
            </span>

            <span>
                ₹<%=String.format(
                    "%.2f",
                    grandTotal
                )%>
            </span>

        </div>


        <!-- DELIVERY TIME -->

        <div class="delivery-time">

            <div class="delivery-icon">
                🛵
            </div>

            <div class="delivery-text">

                <strong>
                    Estimated Delivery Time
                </strong>

                <span>
                    Your order will arrive in 30–40 minutes.
                </span>

            </div>

        </div>


        <!-- PLACE ORDER -->

        <button
            type="submit"
            class="place-order-btn">

            Place Order • ₹<%=String.format(
                "%.2f",
                grandTotal
            )%>

        </button>


        <!-- BACK TO CART -->

        <a
            href="<%=request.getContextPath()%>/cart.jsp"
            class="back-cart">

            Back to Cart

        </a>


        <div class="security">

            🔒 Your payment and personal information are
            protected and securely processed.

        </div>


    </div>

</div>

</form>


<script>

/* =========================
   PAYMENT SELECTION
   ========================= */

function selectPayment(card, method) {

    var cards =
        document.querySelectorAll(".payment-card");

    cards.forEach(function(item) {

        item.classList.remove("selected");

    });

    card.classList.add("selected");

    document.getElementById("paymentMethod").value = method;
}


/* =========================
   ADDRESS SELECTION
   ========================= */

function selectAddress(address) {

    var addresses =
        document.querySelectorAll(".address-option");

    addresses.forEach(function(item) {

        item.classList.remove("active");

    });

    address.classList.add("active");
}

</script>


</body>

</html>