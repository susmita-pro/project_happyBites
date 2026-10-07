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

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("====================================");
        System.out.println("     FORGOT PASSWORD SERVLET");
        System.out.println("====================================");

        try {

            // Get values from forgot-password.jsp
            String email = req.getParameter("email");
            String newPassword = req.getParameter("newPassword");
            String confirmPassword = req.getParameter("confirmPassword");

            System.out.println("DEBUG: Email = [" + email + "]");


            // =========================
            // CHECK EMAIL
            // =========================

            if (email == null || email.trim().isEmpty()) {

                resp.sendRedirect(
                        req.getContextPath()
                        + "/forgot-password.jsp?error=empty"
                );

                return;
            }


            // =========================
            // CHECK NEW PASSWORD
            // =========================

            if (newPassword == null || newPassword.trim().isEmpty()) {

                resp.sendRedirect(
                        req.getContextPath()
                        + "/forgot-password.jsp?error=empty"
                );

                return;
            }


            // =========================
            // CHECK CONFIRM PASSWORD
            // =========================

            if (confirmPassword == null ||
                    !newPassword.equals(confirmPassword)) {

                System.out.println(
                        "DEBUG: PASSWORDS DO NOT MATCH"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/forgot-password.jsp?error=mismatch"
                );

                return;
            }


            // =========================
            // CREATE DAO
            // =========================

            UserDAOImpl dao = new UserDAOImpl();


            // =========================
            // FIND USER
            // =========================

            User user = dao.getUserByEmail(email.trim());

            if (user == null) {

                System.out.println(
                        "DEBUG: USER NOT FOUND"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/forgot-password.jsp?error=notfound"
                );

                return;
            }

            System.out.println(
                    "DEBUG: USER FOUND"
            );


            // =========================
            // ENCRYPT NEW PASSWORD
            // =========================

            String encryptedPassword =
                    BCrypt.hashpw(
                            newPassword,
                            BCrypt.gensalt()
                    );

            System.out.println(
                    "DEBUG: New password encrypted"
            );


            // =========================
            // UPDATE PASSWORD
            // =========================

            boolean updated =
                    dao.updatePassword(
                            email.trim(),
                            encryptedPassword
                    );


            // =========================
            // CHECK UPDATE RESULT
            // =========================

            if (updated) {

                System.out.println(
                        "DEBUG: PASSWORD UPDATED SUCCESSFULLY"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/login.jsp?success=1"
                );

            } else {

                System.out.println(
                        "DEBUG: PASSWORD UPDATE FAILED"
                );

                resp.sendRedirect(
                        req.getContextPath()
                        + "/forgot-password.jsp?error=failed"
                );
            }


        } catch (Exception e) {

            System.out.println(
                    "DEBUG: UNEXPECTED ERROR"
            );

            e.printStackTrace();

            resp.sendRedirect(
                    req.getContextPath()
                    + "/forgot-password.jsp?error=failed"
            );
        }

        System.out.println("====================================");
        System.out.println("   FORGOT PASSWORD SERVLET END");
        System.out.println("====================================");
    }
}