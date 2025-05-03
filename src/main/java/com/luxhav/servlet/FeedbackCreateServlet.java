package com.luxhav.servlet;

import com.luxhav.model.Feedback;
import com.luxhav.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/feedback")
public class FeedbackCreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final FeedbackService feedbackService = new FeedbackService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String reservationIdParam = request.getParameter("reservationId");
        if (reservationIdParam == null) {
            response.sendRedirect(request.getContextPath() + "/my-bookings");
            return;
        }

        request.setAttribute("reservationId", reservationIdParam);
        request.setAttribute("isLoggedIn", true);
        request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
        request.getRequestDispatcher("/client/feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int userId = (int) session.getAttribute("userIdSession");
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            Feedback feedback = new Feedback();
            feedback.setUserId(userId);
            feedback.setReservationId(reservationId);
            feedback.setRating(rating);
            feedback.setComment(comment);

            boolean success = feedbackService.createFeedback(feedback);
            if (success) {
                request.setAttribute("success", "Thank you! Your feedback has been submitted.");
            } else {
                request.setAttribute("error", "Failed to submit feedback. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
        }

        request.getRequestDispatcher("/client/feedback.jsp").forward(request, response);
    }
}