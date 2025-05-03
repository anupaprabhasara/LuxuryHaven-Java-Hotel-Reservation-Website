package com.luxhav.servlet;

import com.luxhav.model.User;
import com.luxhav.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("userSession") != null) {
            isLoggedIn = true;

            // Fetch fresh user details (optional, if required)
            int userId = (int) session.getAttribute("userIdSession");
            User user = userService.getUserById(userId);

            request.setAttribute("user", user);
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
        }

        request.setAttribute("isLoggedIn", isLoggedIn);
        request.getRequestDispatcher("/client/home.jsp").forward(request, response);
    }
}