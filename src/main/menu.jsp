<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.HappyBites.Model.Menu"%>

<%
    List<Menu> menuList =
        (List<Menu>) request.getAttribute("menuList");

    Integer restaurantId =
        (Integer) request.getAttribute("restaurantId");

    int rid = 1;

    if (restaurantId != null) {
        rid = restaurantId;
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>HappyBites | Menu</title>

<style>

/* =========================
   GENERAL
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background: #f8f9fa;
    color: #333;
}


/* =========================
   NAVBAR
========================= */

nav {
    background: linear-gradient(135deg, #ff4d6d, #ff7b54);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 60px;
    position: sticky;
    top: 0;
    z-index: 100;
}

.logo {
    font-size: 32px;
    font-weight: bold;
    color: white;
}

nav ul {
    display: flex;
    list-style: none;
}

nav ul li {
    margin-left: 30px;
}

nav ul li a {
    text-decoration: none;
    color: white;
    font-size: 18px;
    font-weight: bold;
}

nav ul li a:hover {
    color: #ffeb3b;
}


/* =========================
   HEADER
========================= */

.header {
    text-align: center;
    padding: 40px 20px 20px;
}

.header h1 {
    color: #ff5722;
    font-size: 42px;
}

.header p {
    color: #666;
    margin-top: 10px;
    font-size: 18px;
}


/* =========================
   CONTAINER
========================= */

.container {
    width: 90%;
    max-width: 1200px;
    margin: auto;

    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(280px, 1fr));

    gap: 30px;

    padding-bottom: 50px;
}


/* =========================
   CARD
========================= */

.card {
    background: white;
    border-radius: 15px;
    overflow: hidden;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.08);

    transition: 0.3s;

    display: flex;
    flex-direction: column;
}

.card:hover {
    transform: translateY(-8px);

    box-shadow:
        0 12px 25px rgba(0,0,0,0.15);
}


/* =========================
   IMAGE
========================= */

.card img {
    width: 100%;
    height: 220px;

    object-fit: cover;
    display: block;
}


/* =========================
   IMAGE FALLBACK
========================= */

.no-image {
    width: 100%;
    height: 220px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #eeeeee;
    color: #777;

    font-size: 18px;
}


/* =========================
   DETAILS
========================= */

.details {
    padding: 18px;

    display: flex;
    flex-direction: column;

    flex-grow: 1;
}

.details h2 {
    color: #333;

    margin-bottom: 8px;

    font-size: 24px;
}


/* =========================
   PRICE
========================= */

.price {
    color: #ff5722;

    font-size: 26px;

    font-weight: bold;

    margin: 8px 0;
}


/* =========================
   DESCRIPTION
========================= */

.description {
    color: #666;

    line-height: 22px;

    font-size: 14px;

    min-height: 44px;

    flex-grow: 1;
}


/* =========================
   FORM
========================= */

.cart-form {
    width: 100%;
}


/* =========================
   BUTTON
========================= */

.cart-button {
    width: 100%;

    margin-top: 15px;

    padding: 13px;

    border: none;

    background: #ff5722;

    color: white;

    font-size: 17px;

    font-weight: bold;

    border-radius: 8px;

    cursor: pointer;

    transition: 0.3s;
}

.cart-button:hover {
    background: #e64a19;
}


/* =========================
   MOBILE
========================= */

@media(max-width:700px) {

    nav {
        padding: 15px 20px;

        flex-direction: column;

        gap: 15px;
    }

    nav ul li {
        margin-left: 15px;
    }

    .header h1 {
        font-size: 32px;
    }

    .container {
        width: 95%;

        grid-template-columns: 1fr;
    }

}

</style>

</head>


<body>


<!-- =========================
     NAVBAR
========================= -->

<nav>

    <div class="logo">
        🍔 HappyBites
    </div>

    <ul>

        <li>
            <a href="<%=request.getContextPath()%>/restaurant.jsp">
                Restaurants
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/cart.jsp">
                Cart 🛒
            </a>
        </li>

        <li>
            <a href="<%=request.getContextPath()%>/login.jsp">
                Logout
            </a>
        </li>

    </ul>

</nav>


<!-- =========================
     HEADER
========================= -->

<div class="header">

    <h1>

<%
    if (restaurantId != null) {

        switch (restaurantId) {

            case 1:
                out.print("🍕 Pizza Hut Menu");
                break;

            case 2:
                out.print("🍗 KFC Menu");
                break;

            case 3:
                out.print("🍔 McDonald's Menu");
                break;

            case 4:
                out.print("🍝 Truffles Menu");
                break;

            case 5:
                out.print("🍛 Empire Menu");
                break;

            case 6:
                out.print("🍨 Polar Bear Menu");
                break;

            case 7:
                out.print("🥘 A2B Menu");
                break;

            case 8:
                out.print("🌮 Taco Bell Menu");
                break;

            case 9:
                out.print("☕ Starbucks Menu");
                break;

            case 10:
                out.print("🍗 Meghana Foods Menu");
                break;

            case 11:
                out.print("🔥 Barbeque Nation Menu");
                break;

            case 12:
                out.print("🥟 Wow! Momo Menu");
                break;

            default:
                out.print("🍽️ Restaurant Menu");
                break;
        }

    } else {

        out.print("🍽️ Restaurant Menu");

    }
%>

    </h1>

    <p>
        Fresh • Delicious • Fast Delivery
    </p>

</div>


<!-- =========================
     MENU CARDS
========================= -->

<div class="container">

<%
    if (menuList != null && !menuList.isEmpty()) {

        for (Menu menu : menuList) {

            String imagePath = menu.getImagePath();

            String imageSrc = "";

            /*
             * IMAGE PATH
             *
             * Actual folder:
             *
             * src/main/webapp/images/
             *
             * Example:
             *
             * src/main/webapp/images/big_mac.jpg
             *
             * Browser:
             *
             * /HappyBites/images/big_mac.jpg
             */

            if (imagePath != null &&
                !imagePath.trim().isEmpty()) {

                imagePath = imagePath.trim();

                // Convert Windows slash to normal slash
                imagePath = imagePath.replace("\\", "/");

                // Remove starting /
                while (imagePath.startsWith("/")) {
                    imagePath = imagePath.substring(1);
                }

                /*
                 * If database contains:
                 *
                 * images/big_mac.jpg
                 *
                 * or:
                 *
                 * images/menu/mcdonalds/big_mac.jpg
                 *
                 * take only the filename.
                 */

                int lastSlash =
                    imagePath.lastIndexOf("/");

                if (lastSlash >= 0) {

                    imagePath =
                        imagePath.substring(lastSlash + 1);
                }

                /*
                 * Final URL:
                 *
                 * /HappyBites/images/big_mac.jpg
                 */

                imageSrc =
                    request.getContextPath()
                    + "/images/"
                    + imagePath;
            }

%>


<!-- =========================
     CARD
========================= -->

<div class="card">


<%
    if (!imageSrc.isEmpty()) {
%>

    <!-- FOOD IMAGE -->

    <img
        src="<%=imageSrc%>"
        alt="<%=menu.getItemName()%>"

        onerror="
            this.style.display='none';
            this.nextElementSibling.style.display='flex';
        "
    >


    <!-- IMAGE FALLBACK -->

    <div
        class="no-image"
        style="display:none;"
    >
        Image Not Available
    </div>


<%
    } else {
%>


    <!-- NO IMAGE PATH -->

    <div class="no-image">
        Image Not Available
    </div>


<%
    }
%>


    <!-- =========================
         FOOD DETAILS
    ========================= -->

    <div class="details">

        <h2>
            <%=menu.getItemName()%>
        </h2>


        <div class="price">
            ₹ <%=menu.getPrice()%>
        </div>


        <p class="description">
            <%=menu.getDescription()%>
        </p>


        <!-- =========================
             ADD TO CART
        ========================= -->

        <form
            class="cart-form"
            action="<%=request.getContextPath()%>/CartServlet"
            method="post"
        >

            <!-- ACTION -->

            <input
                type="hidden"
                name="action"
                value="add"
            >


            <!-- MENU ID -->

            <input
                type="hidden"
                name="menuId"
                value="<%=menu.getMenuID()%>"
            >


            <!-- RESTAURANT ID -->

            <input
                type="hidden"
                name="restaurantId"
                value="<%=menu.getRestaurantID()%>"
            >


            <!-- QUANTITY -->

            <input
                type="hidden"
                name="qty"
                value="1"
            >


            <!-- ADD TO CART BUTTON -->

            <button
                type="submit"
                class="cart-button"
            >
                Add To Cart 🛒
            </button>

        </form>

    </div>

</div>


<%
        }   // END FOR LOOP

    } else {
%>


<!-- =========================
     NO MENU
========================= -->

<div
    style="
        grid-column:1/-1;
        text-align:center;
        padding:50px;
    "
>

    <h2 style="color:#ff5722;">
        🍽️ No Menu Available
    </h2>

</div>


<%
    }   // END IF
%>


</div>


</body>
</html>