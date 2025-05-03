package com.luxhav.servlet;

import com.luxhav.model.User;
import com.luxhav.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        // Password validation
        if (password.length() < 8 ||
            !password.matches(".*[A-Z].*") ||
            !password.matches(".*[a-z].*") ||
            !password.matches(".*\\d.*")) {
            request.setAttribute("error", "Password must be at least 8 characters and include uppercase, lowercase, and a number.");
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
            return;
        }

        // Email already in use check
        if (userService.getUserByEmail(email) != null) {
            request.setAttribute("error", "Email is already registered.");
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
            return;
        }

        // Create user object
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setAddress(address);

        // Create user
        boolean success = userService.createUser(user);

        if (success) {
            request.setAttribute("success", "Registration successful! Please login.");
        } else {
            request.setAttribute("error", "Registration failed. Please try again.");
        }

        request.getRequestDispatcher("/client/register.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userSession") != null) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.getRequestDispatcher("/client/register.jsp").forward(request, response);
        }
    }
}