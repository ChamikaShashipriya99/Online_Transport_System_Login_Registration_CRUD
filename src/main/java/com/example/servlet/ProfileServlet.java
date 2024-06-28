package com.example.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.example.dao.UserDAO;
import com.example.model.User;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String dateOfBirthStr = request.getParameter("dateOfBirth");

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date dateOfBirth = null;
            try {
                dateOfBirth = format.parse(dateOfBirthStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            user.setPassword(password);
            user.setEmail(email);
            user.setFullName(fullName);
            user.setDateOfBirth(dateOfBirth);

            try {
                userDAO.updateUser(user);
                session.setAttribute("user", user);
                request.setAttribute("successMessage", "Profile updated successfully");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to update profile");
            }
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}