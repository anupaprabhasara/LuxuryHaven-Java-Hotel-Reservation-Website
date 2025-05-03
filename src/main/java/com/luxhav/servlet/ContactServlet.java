package com.luxhav.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if user is logged in
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = false;

        if (session != null && session.getAttribute("userSession") != null) {
            isLoggedIn = true;
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
        }

        // Set flag and forward to JSP
        request.setAttribute("isLoggedIn", isLoggedIn);
        request.getRequestDispatcher("/client/contact.jsp").forward(request, response);
    }
}