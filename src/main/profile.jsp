<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Profile - HappyBites</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;

    background: linear-gradient(
        135deg,
        #080b12,
        #111827,
        #080b12
    );

    min-height: 100vh;

    color: white;
}


/* HEADER */

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


/* PROFILE CONTAINER */

.profile-container {

    width: 90%;

    max-width: 550px;

    margin: 50px auto;

    background: #303442;

    border: 1px solid #444958;

    border-radius: 15px;

    padding: 35px;

    box-shadow: 0 0 25px rgba(0,0,0,0.5);
}


/* TITLE */

.profile-title {

    text-align: center;

    margin-bottom: 30px;
}

.profile-title h1 {

    margin: 0 0 10px;

    font-size: 26px;
}

.profile-title p {

    margin: 0;

    color: #9da1ae;

    font-size: 13px;
}


/* MENU */

.profile-menu {

    display: flex;

    flex-direction: column;

    gap: 12px;
}


.profile-menu a {

    display: flex;

    align-items: center;

    gap: 15px;

    padding: 16px;

    background: #272b38;

    border: 1px solid #454a59;

    border-radius: 9px;

    color: white;

    text-decoration: none;

    font-size: 14px;

    transition: 0.2s;
}


.profile-menu a:hover {

    border-color: #ff8f85;

    background: #303442;

}


.menu-icon {

    font-size: 21px;

    width: 30px;

    text-align: center;
}


.menu-text {

    display: flex;

    flex-direction: column;

    gap: 4px;
}


.menu-title {

    font-weight: bold;
}


.menu-description {

    font-size: 11px;

    color: #9da1ae;
}


/* LOGOUT */

.logout {

    color: #ff8f85 !important;
}


/* BACK HOME */

.back-home {

    display: block;

    text-align: center;

    margin-top: 25px;

    color: #ff9f95;

    text-decoration: none;

    font-size: 13px;

    font-weight: bold;
}

.back-home:hover {

    color: #ff5733;
}


</style>

</head>


<body>


<!-- HEADER -->

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


<!-- PROFILE -->

<div class="profile-container">


    <div class="profile-title">

        <h1>
            My Profile
        </h1>

        <p>
            Manage your HappyBites account
        </p>

    </div>


    <div class="profile-menu">


        <!-- MY ORDERS -->

        <a href="<%=request.getContextPath()%>/orders.jsp">

            <div class="menu-icon">
                📦
            </div>

            <div class="menu-text">

                <div class="menu-title">
                    My Orders
                </div>

                <div class="menu-description">
                    View your previous orders
                </div>

            </div>

        </a>


        <!-- SAVED ADDRESSES -->

        <a href="<%=request.getContextPath()%>/checkout.jsp">

            <div class="menu-icon">
                📍
            </div>

            <div class="menu-text">

                <div class="menu-title">
                    Delivery Address
                </div>

                <div class="menu-description">
                    Manage your delivery address
                </div>

            </div>

        </a>


        <!-- HELP -->

        <a href="#">

            <div class="menu-icon">
                ❓
            </div>

            <div class="menu-text">

                <div class="menu-title">
                    Help & Support
                </div>

                <div class="menu-description">
                    Get help with your orders
                </div>

            </div>

        </a>


        <!-- LOGOUT -->

        <a
            href="<%=request.getContextPath()%>/LogoutServlet"
            class="logout">

            <div class="menu-icon">
                🚪
            </div>

            <div class="menu-text">

                <div class="menu-title">
                    Logout
                </div>

                <div class="menu-description">
                    Sign out from HappyBites
                </div>

            </div>

        </a>


    </div>


    <!-- BACK HOME -->

    <a
        href="<%=request.getContextPath()%>/restaurant.jsp"
        class="back-home">

        ← Back to Restaurants

    </a>


</div>


</body>

</html>