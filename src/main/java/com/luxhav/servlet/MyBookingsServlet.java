package com.luxhav.servlet;

import com.luxhav.model.Reservation;
import com.luxhav.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/my-bookings")
public class MyBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ReservationService reservationService;

    @Override
    public void init() throws ServletException {
        reservationService = new ReservationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("userSession") == null || session.getAttribute("userIdSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userIdSession");

        List<Reservation> reservations = reservationService.getReservationsByUserId(userId);
        request.setAttribute("reservations", reservations);
        request.setAttribute("today", LocalDate.now().toString()); // For comparison in JSP
        request.setAttribute("isLoggedIn", true);
        request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));

        request.getRequestDispatcher("/client/my-bookings.jsp").forward(request, response);
    }
}