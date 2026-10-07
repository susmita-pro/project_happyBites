package com.HappyBites.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.HappyBites.DAOImpl.UserDAOImpl;
import com.HappyBites.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("====================================");
        System.out.println("        LOGIN SERVLET START");
        System.out.println("====================================");

        try {

            // Get email and password from login.jsp
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            System.out.println(
                    "DEBUG: Email received = [" + email + "]"
            );

            // Check email
            if (email == null || email.trim().isEmpty()) {

                System.out.println(
                        "DEBUG: Email is NULL or EMPTY"
                );

                resp.sendRedirect(
                        req.getContextPath() + "/login.jsp"
                );

                return;
            }

            // Check password
            if (password == null || password.isEmpty()) {

                System.out.println(
                        "DEBUG: Password is NULL or EMPTY"
                );

                resp.sendRedirect(
                        req.getContextPath() + "/login.jsp"
                );

                return;
            }

            // Create DAO object
            UserDAOImpl dao = new UserDAOImpl();

            System.out.println(
                    "DEBUG: Calling getUserByEmail()..."
            );

            // Find user using email
            User user = dao.getUserByEmail(email.trim());

            // User not found
            if (user == null) {

                System.out.println(
                        "DEBUG: RESULT = USER NOT FOUND"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/login.jsp?error=1"
                );

                return;
            }

            // User found
            System.out.println(
                    "DEBUG: RESULT = USER FOUND"
            );

            System.out.println(
                    "DEBUG: Username = "
                    + user.getUsername()
            );

            System.out.println(
                    "DEBUG: Email = "
                    + user.getEmail()
            );

            // Get encrypted password from database
            String dbPassword = user.getPassword();

            if (dbPassword == null ||
                    dbPassword.trim().isEmpty()) {

                System.out.println(
                        "DEBUG: Database password is NULL/EMPTY"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/login.jsp?error=1"
                );

                return;
            }

            // Check BCrypt password
            System.out.println(
                    "DEBUG: Checking BCrypt password..."
            );

            boolean passwordMatch;

            try {

                passwordMatch =
                        BCrypt.checkpw(
                                password,
                                dbPassword
                        );

            } catch (IllegalArgumentException e) {

                System.out.println(
                        "DEBUG: INVALID BCRYPT HASH"
                );

                e.printStackTrace();

                resp.sendRedirect(
                        req.getContextPath()
                        + "/login.jsp?error=1"
                );

                return;
            }

            System.out.println(
                    "DEBUG: BCrypt result = "
                    + passwordMatch
            );


            // =========================
            // LOGIN SUCCESS
            // =========================

            if (passwordMatch) {

                System.out.println(
                        "DEBUG: LOGIN SUCCESS"
                );

                // Create session
                HttpSession session =
                        req.getSession();

                session.setAttribute(
                        "user",
                        user
                );

                session.setAttribute(
                        "userId",
                        user.getUserID()
                );

                session.setAttribute(
                        "username",
                        user.getUsername()
                );

                session.setAttribute(
                        "email",
                        user.getEmail()
                );

                session.setAttribute(
                        "role",
                        user.getRole()
                );

                System.out.println(
                        "DEBUG: Session created"
                );

                /*
                 * IMPORTANT:
                 * Your project uses restaurant.jsp,
                 * not restaurant.html
                 */

                System.out.println(
                        "DEBUG: Redirecting to restaurant.jsp"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/restaurant.jsp"
                );

            } else {

                // =========================
                // WRONG PASSWORD
                // =========================

                System.out.println(
                        "DEBUG: WRONG PASSWORD"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/login.jsp?error=1"
                );
            }

        } catch (Exception e) {

            System.out.println(
                    "DEBUG: UNEXPECTED ERROR"
            );

            e.printStackTrace();

            resp.sendRedirect(
                    req.getContextPath()
                    + "/login.jsp?error=1"
            );
        }

        System.out.println(
                "===================================="
        );

        System.out.println(
                "         LOGIN SERVLET END"
        );

        System.out.println(
                "===================================="
        );
    }
}