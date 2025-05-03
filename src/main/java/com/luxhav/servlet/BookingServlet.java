package com.luxhav.servlet;

import com.luxhav.model.Reservation;
import com.luxhav.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ReservationService reservationService;

    @Override
    public void init() throws ServletException {
        reservationService = new ReservationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check login session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Capture roomId from query param
        String roomIdParam = request.getParameter("roomId");
        if (roomIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Room ID is required.");
            return;
        }

        request.setAttribute("roomId", roomIdParam);
        request.setAttribute("isLoggedIn", true);
        request.getRequestDispatcher("/client/booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ensure user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userIdSession");
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");

        Reservation reservation = new Reservation();
        reservation.setUserId(userId);
        reservation.setRoomId(roomId);
        reservation.setCheckInDate(checkInDate);
        reservation.setCheckOutDate(checkOutDate);
        reservation.setStatus("Pending");

        boolean created = reservationService.createReservation(reservation);

        if (created) {
            request.setAttribute("success", "Booking successful! You will be contacted by our staff.");
            request.getRequestDispatcher("/client/booking.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Booking failed. Please try again.");
            request.getRequestDispatcher("/client/booking.jsp").forward(request, response);
        }
    }
}