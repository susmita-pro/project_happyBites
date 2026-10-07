<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HappyBites - Food Delivery</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#111;
    color:white;
}

/*================ NAVBAR ================*/

nav{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:80px;
    background:rgba(0,0,0,0.95);
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:0 80px;
    z-index:1000;
    box-shadow:0 2px 20px rgba(255,0,0,.2);
}

.logo{
    font-size:34px;
    color:#ff4d4d;
    font-weight:bold;
}

.logo span{
    color:white;
}

nav ul{
    display:flex;
    list-style:none;
}

nav ul li{
    margin-left:35px;
}

nav ul li a{
    color:white;
    text-decoration:none;
    font-size:18px;
    transition:.3s;
}

nav ul li a:hover{
    color:#ff4d4d;
}

/*================ HERO ================*/

.hero{

    height:100vh;

    background:
    linear-gradient(rgba(0,0,0,.65),rgba(0,0,0,.75)),
    url("images/banner.jpg");

    background-size:cover;

    background-position:center;

    display:flex;

    justify-content:center;

    align-items:center;

    text-align:center;
}

.hero-content h1{

    font-size:65px;

    margin-bottom:20px;
}

.hero-content h1 span{

    color:#ff4d4d;
}

.hero-content p{

    font-size:22px;

    color:#ddd;

    margin-bottom:40px;
}

/*================ SEARCH BAR ================*/

.search-box{

    width:800px;

    background:white;

    padding:8px;

    border-radius:50px;

    display:flex;

    margin:auto;
}

.search-box input{

    width:100%;

    border:none;

    outline:none;

    padding:18px;

    font-size:18px;

    border-radius:50px;
}

.search-box button{

    width:170px;

    border:none;

    background:#ff4d4d;

    color:white;

    border-radius:50px;

    font-size:18px;

    cursor:pointer;

    transition:.3s;
}

.search-box button:hover{

    background:#ff1f1f;
}

/*================ HERO BUTTONS ================*/

.hero-btn{

    margin-top:35px;
}

.hero-btn a{

    display:inline-block;

    padding:14px 35px;

    margin:10px;

    text-decoration:none;

    border-radius:40px;

    font-size:18px;

    transition:.4s;
}
.categories{

padding:80px;
background:#181818;
text-align:center;

}

.categories h2{

font-size:42px;
margin-bottom:50px;

}

.category-container{

display:flex;
justify-content:center;
flex-wrap:wrap;
gap:35px;

}

.category{

width:170px;
background:#222;
padding:20px;
border-radius:20px;
transition:.4s;
cursor:pointer;

}

.category:hover{

background:#ff4d4d;
transform:translateY(-10px);

}

.category img{

width:90px;
height:90px;
border-radius:50%;

}

.category h3{

margin-top:15px;

}



.restaurants{

padding:90px;
background:#111;

}

.restaurants h2{

text-align:center;
font-size:45px;
margin-bottom:50px;

}

.restaurant-container{

display:flex;
justify-content:center;
flex-wrap:wrap;
gap:35px;

}

.card{

width:330px;
background:#222;
border-radius:20px;
overflow:hidden;
transition:.4s;

}

.card:hover{

transform:translateY(-10px);

}

.card img{

width:100%;
height:220px;
object-fit:cover;

}

.content{

padding:20px;

}

.content h3{

font-size:28px;
margin-bottom:10px;

}

.content p{

margin-bottom:8px;
color:#ddd;

}

.content a{

display:inline-block;
padding:10px 22px;
background:#ff4d4d;
color:white;
text-decoration:none;
border-radius:25px;
margin-top:10px;

}

.content a:hover{

background:#ff1f1f;

}
.order{

    background:#ff4d4d;

    color:white;
}

.order:hover{

    background:#ff1f1f;
}

.explore{

    border:2px solid white;

    color:white;
}

.explore:hover{

    background:white;

    color:black;
}
.offer{
position:absolute;
top:15px;
left:15px;
background:red;
color:white;
padding:6px 12px;
border-radius:20px;
font-size:14px;
font-weight:bold;
}

.heart{
position:absolute;
top:15px;
right:15px;
background:white;
color:red;
width:35px;
height:35px;
border-radius:50%;
display:flex;
justify-content:center;
align-items:center;
font-size:20px;
cursor:pointer;
}

.card{
position:relative;
}

.offers{
padding:80px;
background:#181818;
text-align:center;
}

.offer-box{
display:flex;
justify-content:center;
flex-wrap:wrap;
gap:30px;
margin-top:40px;
}

.offer-card{
background:#222;
width:280px;
padding:25px;
border-radius:20px;
transition:.4s;
}

.offer-card:hover{
background:#ff4d4d;
transform:translateY(-10px);
}

.reviews{
padding:80px;
background:#111;
text-align:center;
}

.review-container{
display:flex;
justify-content:center;
flex-wrap:wrap;
gap:30px;
margin-top:40px;
}

.review{
width:320px;
background:#222;
padding:25px;
border-radius:20px;
transition:.4s;
}

.review:hover{
transform:translateY(-10px);
background:#333;
}
/*================ FOOTER ================*/

footer{

background:#0b0b0b;

padding:70px 80px 20px;

}

.footer-container{

display:flex;

justify-content:space-between;

flex-wrap:wrap;

gap:40px;

}

.footer-box{

width:250px;

}

.footer-box h2{

color:#ff4d4d;

margin-bottom:20px;

}

.footer-box h3{

margin-bottom:20px;

color:white;

}

.footer-box p{

color:#bbb;

line-height:28px;

}

.footer-box a{

display:block;

text-decoration:none;

color:#bbb;

margin-bottom:10px;

transition:.3s;

}

.footer-box a:hover{

color:#ff4d4d;

padding-left:8px;

}

.copyright{

margin-top:50px;

text-align:center;

color:#888;

border-top:1px solid #333;

padding-top:20px;

}


/*================ SCROLL BUTTON ================*/

.top-btn{

position:fixed;

right:30px;

bottom:30px;

width:55px;

height:55px;

background:#ff4d4d;

color:white;

text-decoration:none;

display:flex;

justify-content:center;

align-items:center;

font-size:26px;

border-radius:50%;

transition:.4s;

box-shadow:0 0 15px rgba(255,77,77,.6);

}

.top-btn:hover{

transform:scale(1.1);

background:#ff1f1f;

}


/*================ ANIMATIONS ================*/

.card{

animation:fadeUp .8s ease;

}

.category{

animation:zoom .8s ease;

}

.offer-card{

animation:fadeUp .8s ease;

}

.review{

animation:fadeUp .8s ease;

}

@keyframes fadeUp{

0%{

opacity:0;

transform:translateY(50px);

}

100%{

opacity:1;

transform:translateY(0);

}

}

@keyframes zoom{

0%{

transform:scale(.8);

opacity:0;

}

100%{

transform:scale(1);

opacity:1;

}

}

html {
    scroll-behavior: smooth;
}

#restaurants {
    scroll-margin-top: 90px;
}

#offers {
    scroll-margin-top: 90px;
}


/*================ RESPONSIVE ================*/

@media(max-width:992px){

nav{

padding:20px;

}

nav ul{

display:none;

}

.search-box{

width:95%;

}

.hero-content h1{

font-size:42px;

}

.restaurant-container,

.category-container,

.offer-box,

.review-container{

flex-direction:column;

align-items:center;

}

.footer-container{

flex-direction:column;

}

}

</style>

</head>

<body>

<!-- NAVIGATION -->

<nav>

<div class="logo">

🍔 Happy<span>Bites</span>

</div>

<ul>
    <li><a href="<%=request.getContextPath()%>/restaurant.jsp">Home</a></li>
    <li><a href="#restaurants">Restaurants</a></li>
    <li><a href="<%=request.getContextPath()%>/restaurant.jsp#offers">Offers</a></li>
    <li><a href="<%=request.getContextPath()%>/cart.jsp">Cart 🛒</a></li>
    <li><a href="<%=request.getContextPath()%>/profile.jsp">Profile</a></li>
    <li><a href="<%=request.getContextPath()%>/login.jsp">Login</a></li>
    <li><a href="<%=request.getContextPath()%>/register.html">Sign Up</a></li>
</ul>

</nav>

<!-- HERO -->

<section class="hero">

<div class="hero-content">

<h1>

Discover The Best <span>Food</span> Near You

</h1>

<p>

Order delicious food from your favourite restaurants with lightning-fast delivery.

</p>

<div class="search-box">

<input type="text" placeholder="Search Restaurants, Food, Drinks...">

<button>Search</button>

</div>

<div class="hero-btn">

<a href="#" class="order">Order Now</a>

<a href="#" class="explore">Explore Restaurants</a>

</div>

</div>

</section>

<!-- ================= CATEGORIES ================= -->

<section class="categories">

<h2>🍽️ Explore Categories</h2>

<div class="category-container">

<div class="category">
<img src="images/burger.jpg" alt="Burger">
<h3>Burgers</h3>
</div>

<div class="category">
<img src="images/pizza.jpg" alt="Pizza">
<h3>Pizza</h3>
</div>

<div class="category">
<img src="images/biryani.jpg" alt="Biryani">
<h3>Biryani</h3>
</div>

<div class="category">
<img src="images/chicken.jpg" alt="Chicken">
<h3>Chicken</h3>
</div>

<div class="category">
<img src="images/icecream.jpg" alt="Ice Cream">
<h3>Ice Cream</h3>
</div>

<div class="category">
<img src="images/coffee.jpg" alt="Coffee">
<h3>Coffee</h3>
</div>

</div>

</section>





<section class="restaurants" id="restaurants">

<h2> Popular Restaurants</h2>

<div class="restaurant-container">

<div class="card">

<img src="images/mcdonalds.jpg">

<div class="content">

<h3>McDonald's</h3>

<p>⭐ 4.5 • 25 mins</p>

<p>Burgers • Fries • Drinks</p>

<a href="<%=request.getContextPath()%>/MenuServlet?id=3">
    View Menu
</a>

</div>

</div>



<div class="card">

<img src="images/kfc.jpg">

<div class="content">

<h3>KFC</h3>

<p>⭐ 4.6 • 30 mins</p>

<p>Chicken • Bucket • Burger</p>

<a href="<%=request.getContextPath()%>/MenuServlet?id=2">
    View Menu
</a>

</div>

</div>



<div class="card">

<img src="images/pizzahut.jpg">

<div class="content">

<h3>Pizza Hut</h3>

<p>⭐ 4.7 • 28 mins</p>

<p>Pizza • Garlic Bread</p>

<a href="<%=request.getContextPath()%>/MenuServlet?id=1">
    View Menu
</a>

</div>

</div>



<div class="card">

<img src="images/truffles.jpg">

<div class="content">

<h3>Truffles</h3>

<p>⭐ 4.8 • 20 mins</p>

<p>Burger • Pasta • Shake</p>

<a href="MenuServlet?id=4">View Menu</a>

</div>

</div>



<div class="card">

<img src="images/empire.jpg">

<div class="content">

<h3>Empire</h3>

<p>⭐ 4.6 • 35 mins</p>

<p>Biryani • Shawarma</p>

<a href="MenuServlet?id=5">View Menu</a>

</div>

</div>



<div class="card">

<img src="images/polarbear.jpg">

<div class="content">

<h3>Polar Bear</h3>

<p>⭐ 4.8 • 15 mins</p>

<p>Ice Cream • Sundaes</p>

<a href="MenuServlet?id=6">View Menu</a>

</div>

</div>

</div>

</section>
<!-- ================= MORE RESTAURANTS ================= -->

<section class="restaurants">

<h2>✨ Recommended Restaurants</h2>

<div class="restaurant-container">

<!-- A2B -->

<div class="card">

<span class="offer">40% OFF</span>

<span class="heart">❤</span>

<img src="images/a2b.jpg">

<div class="content">

<h3>A2B</h3>

<p>⭐ 4.6 • ⏱ 25 mins</p>

<p>South Indian • Meals • Sweets</p>

<p>📍 Jayanagar, Bangalore</p>

<a href="MenuServlet?id=7">View Menu</a>

</div>

</div>

<!-- Taco Bell -->

<div class="card">

<span class="offer">50% OFF</span>

<span class="heart">❤</span>

<img src="images/tacobell.jpg">

<div class="content">

<h3>Taco Bell</h3>

<p>⭐ 4.5 • ⏱ 28 mins</p>

<p>Tacos • Mexican • Burritos</p>

<p>📍 Koramangala</p>

<a href="MenuServlet?id=8">View Menu</a>

</div>

</div>

<!-- Starbucks -->

<div class="card">

<span class="offer">20% OFF</span>

<span class="heart">❤</span>

<img src="images/starbucks.jpg">

<div class="content">

<h3>Starbucks</h3>

<p>⭐ 4.8 • ⏱ 18 mins</p>

<p>Coffee • Dessert • Sandwich</p>

<p>📍 MG Road</p>

<a href="MenuServlet?id=9">View Menu</a>

</div>

</div>

<!-- Meghana Foods -->

<div class="card">

<span class="offer">30% OFF</span>

<span class="heart">❤</span>

<img src="images/meghana.jpg">

<div class="content">

<h3>Meghana Foods</h3>

<p>⭐ 4.9 • ⏱ 30 mins</p>

<p>Biryani • Andhra • Chinese</p>

<p>📍 BTM Layout</p>

<a href="MenuServlet?id=10">View Menu</a>

</div>

</div>

<!-- Barbeque Nation -->

<div class="card">

<span class="offer">25% OFF</span>

<span class="heart">❤</span>

<img src="images/barbeque.jpg">

<div class="content">

<h3>Barbeque Nation</h3>

<p>⭐ 4.7 • ⏱ 35 mins</p>

<p>BBQ • Grill • Buffet</p>

<p>📍 Indiranagar</p>

<a href="MenuServlet?id=11">View Menu</a>

</div>

</div>

<!-- Wow Momo -->

<div class="card">

<span class="offer">35% OFF</span>

<span class="heart">❤</span>

<img src="images/wowmomo.jpg">

<div class="content">

<h3>Wow! Momo</h3>

<p>⭐ 4.6 • ⏱ 20 mins</p>

<p>Momos • Chinese • Snacks</p>

<p>📍 HSR Layout</p>

<a href="MenuServlet?id=12">View Menu</a>

</div>

</div>

</div>

</section>

<!-- ================= OFFERS ================= -->

<section class="offers" id="offers">

<h2>🎉 Today's Best Offers</h2>

<div class="offer-box">

<div class="offer-card">

<h3>🍕 Buy 1 Get 1 Free</h3>

<p>Applicable on Pizza Hut</p>

</div>

<div class="offer-card">

<h3>🍔 Flat 50% OFF</h3>

<p>On First Order</p>

</div>

<div class="offer-card">

<h3>🚚 Free Delivery</h3>

<p>Above ₹299</p>

</div>

<div class="offer-card">

<h3>🥤 Free Coke</h3>

<p>With Every Burger Combo</p>

</div>

</div>

</section>

<!-- ================= REVIEWS ================= -->

<section class="reviews">

<h2>💬 What Our Customers Say</h2>

<div class="review-container">

<div class="review">

<h3>⭐⭐⭐⭐⭐</h3>

<p>"Amazing Food & Fast Delivery!"</p>

<h4>- Rahul</h4>

</div>

<div class="review">

<h3>⭐⭐⭐⭐⭐</h3>

<p>"Best UI and Delicious Restaurants."</p>

<h4>- Sneha</h4>

</div>

<div class="review">

<h3>⭐⭐⭐⭐☆</h3>

<p>"Loved the Burgers and Ice Cream."</p>

<h4>- Kiran</h4>

</div>

</div>

</section>
<!-- ================= FOOTER ================= -->

<footer>

<div class="footer-container">

<div class="footer-box">

<h2>🍔 HappyBites</h2>

<p>

Delivering happiness with every bite.

Fresh food, Fast delivery and Amazing taste.

</p>

</div>

<div class="footer-box">

<h3>Quick Links</h3>

<a href="#">Home</a>

<a href="#">Restaurants</a>

<a href="#">Offers</a>

<a href="#">Cart</a>

<a href="#">Login</a>

</div>

<div class="footer-box">

<h3>Contact</h3>

<p>📍 Bangalore, India</p>

<p>📞 +91 9876543210</p>

<p>📧 happybites@gmail.com</p>

</div>

<div class="footer-box">

<h3>Follow Us</h3>

<p>📘 Facebook</p>

<p>📷 Instagram</p>

<p>🐦 Twitter</p>

<p>▶ YouTube</p>

</div>

</div>

<div class="copyright">

© 2026 HappyBites | All Rights Reserved ❤️

</div>

</footer>



<!-- Scroll Button -->

<a href="#" class="top-btn">⬆</a>

</body>
</html>
