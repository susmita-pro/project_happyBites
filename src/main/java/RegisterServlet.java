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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        // Hash password
        String hashpw =
                BCrypt.hashpw(password, BCrypt.gensalt(12));

        // Create User object
        User user = new User(
                username,
                hashpw,
                email,
                address,
                role
        );

        // DAO
        UserDAOImpl userDAO = new UserDAOImpl();

        int result = userDAO.addUser(user);

        if (result > 0) {

            System.out.println("Registration Successful");

            // Stay on the SAME registration page
            req.setAttribute(
                    "message",
                    "Registration Successful!"
            );

            req.getRequestDispatcher("register.jsp")
               .forward(req, resp);

        } else {

            System.out.println("Registration Failed");

            req.setAttribute(
                    "message",
                    "Registration Failed!"
            );

            req.getRequestDispatcher("register.jsp")
               .forward(req, resp);
        }
    }
}