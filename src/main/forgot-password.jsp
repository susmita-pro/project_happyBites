<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Forgot Password - HappyBites</title>

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

        .forgot-container {
            width: 350px;
            background-color: #080d17;
            padding: 35px;
            border-radius: 15px;
            border: 1px solid #202a3a;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.7);
            text-align: center;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
            color: #ff5733;
            margin-bottom: 15px;
        }

        h1 {
            color: #76a9ff;
            font-size: 23px;
            margin-bottom: 10px;
        }

        .description {
            color: #8190a8;
            font-size: 12px;
            line-height: 18px;
            margin-bottom: 25px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }

        label {
            display: block;
            color: #dce3ef;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input {
            width: 100%;
            box-sizing: border-box;
            padding: 12px;
            background-color: #111827;
            border: 1px solid #29364b;
            border-radius: 6px;
            color: white;
            outline: none;
            font-size: 13px;
        }

        input::placeholder {
            color: #65748b;
        }

        input:focus {
            border-color: #3d73ff;
        }

        .reset-btn {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            background-color: #1239a8;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        .reset-btn:hover {
            background-color: #1d4ed8;
        }

        .back-login {
            display: inline-block;
            margin-top: 20px;
            color: #ff8066;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
        }

        .back-login:hover {
            color: #ff5733;
        }

        .error {
            color: #ff6b6b;
            font-size: 12px;
            margin-bottom: 15px;
        }

        .success {
            color: #4ade80;
            font-size: 12px;
            margin-bottom: 15px;
        }

    </style>

</head>


<body>

    <div class="forgot-container">

        <div class="logo">
            HappyBites
        </div>

        <h1>
            Forgot Password?
        </h1>

        <div class="description">
            Enter your registered email and
            create a new password.
        </div>


        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");

            if ("notfound".equals(error)) {
        %>

            <div class="error">
                Email address is not registered.
            </div>

        <%
            } else if ("mismatch".equals(error)) {
        %>

            <div class="error">
                Passwords do not match.
            </div>

        <%
            } else if ("empty".equals(error)) {
        %>

            <div class="error">
                Please fill all required fields.
            </div>

        <%
            } else if ("failed".equals(error)) {
        %>

            <div class="error">
                Password reset failed. Please try again.
            </div>

        <%
            } else if ("1".equals(success)) {
        %>

            <div class="success">
                Password reset successfully. Please login.
            </div>

        <%
            }
        %>


        <form
            action="<%=request.getContextPath()%>/ForgotPasswordServlet"
            method="post">


            <div class="form-group">

                <label>
                    Email Address
                </label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter your registered email"
                    required>

            </div>


            <div class="form-group">

                <label>
                    New Password
                </label>

                <input
                    type="password"
                    name="newPassword"
                    placeholder="Enter new password"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Confirm Password
                </label>

                <input
                    type="password"
                    name="confirmPassword"
                    placeholder="Confirm new password"
                    required>

            </div>


            <button
                type="submit"
                class="reset-btn">

                Reset Password

            </button>


        </form>


        <a
            href="<%=request.getContextPath()%>/login.jsp"
            class="back-login">

            ← Back to Login

        </a>

    </div>

</body>

</html>