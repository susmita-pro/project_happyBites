<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Order Confirmed - HappyBites</title>

    <style>

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


        .confirmation-container {

            width: 420px;

            background-color: #080d17;

            padding: 45px 35px;

            border-radius: 18px;

            border: 1px solid #202a3a;

            box-shadow: 0 0 30px rgba(0, 0, 0, 0.7);

            text-align: center;
        }


        .check-circle {

            width: 80px;
            height: 80px;

            margin: 0 auto 25px;

            border-radius: 50%;

            background: linear-gradient(
                135deg,
                #ff8066,
                #ff5733
            );

            display: flex;

            justify-content: center;
            align-items: center;

            box-shadow: 0 0 25px rgba(255, 87, 51, 0.35);
        }


        .check {

            color: white;

            font-size: 48px;

            font-weight: bold;

            line-height: 1;
        }


        h1 {

            margin: 0 0 12px;

            font-size: 30px;

            color: white;
        }


        .message {

            color: #9aa7bb;

            font-size: 14px;

            margin-bottom: 30px;
        }


        .home-btn {

            display: inline-block;

            padding: 12px 32px;

            background-color: #ff8066;

            color: white;

            text-decoration: none;

            border-radius: 25px;

            font-size: 13px;

            font-weight: bold;

            transition: 0.3s;
        }


        .home-btn:hover {

            background-color: #ff5733;

            transform: scale(1.03);
        }

    </style>

</head>


<body>


    <div class="confirmation-container">


        <div class="check-circle">

            <div class="check">
                ✓
            </div>

        </div>


        <h1>
            Order Confirmed!
        </h1>


        <div class="message">
            Your order has been placed successfully.
        </div>


        <a
            href="<%=request.getContextPath()%>/restaurant.jsp"
            class="home-btn">

            Back to Home

        </a>


    </div>


</body>

</html>