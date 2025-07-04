package com.luxhav.servlet;

import com.luxhav.model.User;
import com.luxhav.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check if user is logged in
        if (session == null || session.getAttribute("userSession") == null || session.getAttribute("userIdSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userIdSession");

        // Fetch user details from DB
        User user = userService.getUserById(userId);
        if (user == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
            return;
        }

        request.setAttribute("user", user);
        request.setAttribute("isLoggedIn", true);
        request.setAttribute("userFullName", user.getFullName());

        request.getRequestDispatcher("/client/profile.jsp").forward(request, response);
    }
}