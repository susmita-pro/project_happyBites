<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login - HappyBites</title>

<style>

/* =========================
   BODY
   ========================= */

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

    display: flex;
    justify-content: center;
    align-items: center;

    color: white;
}


/* =========================
   LOGIN CARD
   ========================= */

.login-container {

    width: 350px;

    background-color: #080d17;

    padding: 30px 35px;

    border-radius: 15px;

    box-shadow:
        0 0 25px rgba(0, 0, 0, 0.7);

    border: 1px solid #202a3a;

    text-align: center;
}


/* =========================
   LOGO
   ========================= */

.logo {

    font-size: 25px;

    font-weight: bold;

    color: #ff5733;

    margin-bottom: 12px;
}


/* =========================
   WELCOME
   ========================= */

.login-container h1 {

    margin: 5px 0 8px;

    font-size: 24px;

    color: #76a9ff;
}


/* =========================
   DESCRIPTION
   ========================= */

.description {

    font-size: 12px;

    color: #8190a8;

    line-height: 18px;

    margin-bottom: 25px;
}


/* =========================
   FORM GROUP
   ========================= */

.form-group {

    text-align: left;

    margin-bottom: 18px;
}


/* =========================
   LABEL
   ========================= */

.form-group label {

    display: block;

    font-size: 13px;

    font-weight: bold;

    color: #dce3ef;

    margin-bottom: 8px;
}


/* =========================
   INPUT
   ========================= */

.form-group input {

    width: 100%;

    box-sizing: border-box;

    padding: 12px;

    border-radius: 6px;

    border: 1px solid #29364b;

    background-color: #111827;

    color: white;

    outline: none;

    font-size: 13px;
}


.form-group input::placeholder {

    color: #65748b;
}


.form-group input:focus {

    border-color: #3d73ff;

    box-shadow: 0 0 5px rgba(61, 115, 255, 0.3);
}


/* =========================
   REMEMBER + FORGOT
   ========================= */

.options {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-top: 5px;

    margin-bottom: 18px;

    font-size: 11px;
}


.remember {

    display: flex;

    align-items: center;

    gap: 5px;

    color: #8290a6;
}


.remember input {

    width: auto;

    accent-color: #315eff;
}


.forgot {

    color: #ff8066;

    text-decoration: none;
}


.forgot:hover {

    color: #ff5733;
}


/* =========================
   LOGIN BUTTON
   ========================= */

.login-btn {

    width: 100%;

    padding: 11px;

    border: none;

    border-radius: 5px;

    background-color: #1239a8;

    color: white;

    font-size: 14px;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;
}


.login-btn:hover {

    background-color: #1d4ed8;
}


/* =========================
   ERROR MESSAGE
   ========================= */

.error-message {

    color: #ff6b6b;

    font-size: 12px;

    margin-bottom: 15px;
}


/* =========================
   SUCCESS MESSAGE
   ========================= */

.success-message {

    color: #66ff99;

    font-size: 12px;

    margin-bottom: 15px;
}


/* =========================
   CREATE ACCOUNT
   ========================= */

.create-account {

    margin-top: 18px;

    font-size: 12px;

    color: #8996aa;
}


.create-account a {

    color: #ff8066;

    text-decoration: none;

    font-weight: bold;
}


.create-account a:hover {

    color: #ff5733;
}


/* =========================
   BACK TO HOME
   ========================= */

.back-home {

    display: inline-block;

    margin-top: 18px;

    color: #76a9ff;

    text-decoration: none;

    font-size: 12px;

    font-weight: bold;
}


.back-home:hover {

    color: #a8c4ff;
}


/* =========================
   RESPONSIVE
   ========================= */

@media (max-width: 500px) {

    .login-container {

        width: 75%;

        padding: 25px;
    }

}

</style>

</head>


<body>


<!-- =========================
     LOGIN CARD
     ========================= -->

<div class="login-container">


    <!-- LOGO -->

    <div class="logo">
        HappyBites
    </div>


    <!-- WELCOME -->

    <h1>
        Welcome Back
    </h1>


    <!-- DESCRIPTION -->

    <div class="description">

        Log in to order your favourite food
        and manage your account

    </div>


    <!-- =========================
         ERROR / SUCCESS MESSAGE
         ========================= -->

    <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");

        if (error != null) {
    %>

        <div class="error-message">
            Invalid email or password
        </div>

    <%
        }

        if (success != null) {
    %>

        <div class="success-message">
            Password changed successfully. Please login.
        </div>

    <%
        }
    %>


    <!-- =========================
         LOGIN FORM
         ========================= -->

    <form action="<%=request.getContextPath()%>/LoginServlet"
          method="post">


        <!-- EMAIL -->

        <div class="form-group">

            <label>
                Email Address
            </label>

            <input
                type="email"
                name="email"
                placeholder="Enter your email address"
                required>

        </div>


        <!-- PASSWORD -->

        <div class="form-group">

            <label>
                Password
            </label>

            <input
                type="password"
                name="password"
                placeholder="Enter your password"
                required>

        </div>


        <!-- =========================
             REMEMBER + FORGOT
             ========================= -->

        <div class="options">


            <label class="remember">

                <input
                    type="checkbox"
                    name="remember">

                Remember me

            </label>


            <a href="<%=request.getContextPath()%>/forgot-password.jsp"
               class="forgot">

                Forgot Password?

            </a>


        </div>


        <!-- =========================
             LOGIN BUTTON
             ========================= -->

        <button
            type="submit"
            class="login-btn">

            Login

        </button>


    </form>


    <!-- =========================
         CREATE ACCOUNT
         ========================= -->

    <div class="create-account">

        Don't have an account?

        <a href="<%=request.getContextPath()%>/register.jsp">

            Create Account

        </a>

    </div>


    <!-- =========================
         BACK TO HOME
         ========================= -->

    <a href="<%=request.getContextPath()%>/restaurant.jsp"
       class="back-home">

        ← Back to Home

    </a>


</div>


</body>

</html>