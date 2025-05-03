package com.luxhav.servlet;

import com.luxhav.model.Room;
import com.luxhav.service.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/rooms")
public class RoomPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RoomService roomService;

    @Override
    public void init() throws ServletException {
        roomService = new RoomService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Room> rooms = roomService.getAllRooms();
        request.setAttribute("rooms", rooms);

        // Optionally check login status
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("userSession") != null) {
            request.setAttribute("isLoggedIn", true);
            request.setAttribute("userFullName", session.getAttribute("userFullNameSession"));
        } else {
            request.setAttribute("isLoggedIn", false);
        }

        request.getRequestDispatcher("/client/rooms.jsp").forward(request, response);
    }
}