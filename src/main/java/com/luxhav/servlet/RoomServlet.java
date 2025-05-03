package com.luxhav.servlet;

import com.luxhav.model.Room;
import com.luxhav.service.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/admin/room")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 1024 * 1024 * 5,             // 5MB
        maxRequestSize = 1024 * 1024 * 10)         // 10MB
public class RoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RoomService roomService;

    @Override
    public void init() throws ServletException {
        roomService = new RoomService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if (action == null) {
                request.setAttribute("rooms", roomService.getAllRooms());
                request.getRequestDispatcher("/admin/rooms/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/admin/rooms/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Room room = roomService.getRoomById(id);
                request.setAttribute("room", room);
                request.getRequestDispatcher("/admin/rooms/update.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                roomService.deleteRoom(id);
                response.sendRedirect(request.getContextPath() + "/admin/room");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                String roomNumber = request.getParameter("room_number");
                String roomType = request.getParameter("room_type");
                double pricePerNight = Double.parseDouble(request.getParameter("price_per_night"));
                String status = request.getParameter("status");

                Room room = new Room();
                room.setRoomNumber(roomNumber);
                room.setRoomType(roomType);
                room.setPricePerNight(pricePerNight);
                room.setStatus(status);

                boolean created = roomService.createRoom(room);
                if (created) {
                    int newRoomId = roomService.getAllRooms()
                            .stream().filter(r -> r.getRoomNumber().equals(roomNumber)).findFirst().get().getRoomId();

                    Part imagePart = request.getPart("room_image");
                    if (imagePart != null && imagePart.getSize() > 0) {
                        String uploadPath = getServletContext().getRealPath("/") + "assets/rooms/";
                        File dir = new File(uploadPath);
                        if (!dir.exists()) dir.mkdirs();
                        imagePart.write(uploadPath + File.separator + newRoomId + ".jpg");
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/room");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create room.");
                }

            } else if ("update".equals(action)) {
                int roomId = Integer.parseInt(request.getParameter("id"));
                String roomNumber = request.getParameter("room_number");
                String roomType = request.getParameter("room_type");
                double pricePerNight = Double.parseDouble(request.getParameter("price_per_night"));
                String status = request.getParameter("status");

                Room room = new Room();
                room.setRoomId(roomId);
                room.setRoomNumber(roomNumber);
                room.setRoomType(roomType);
                room.setPricePerNight(pricePerNight);
                room.setStatus(status);

                boolean updated = roomService.updateRoom(room);
                if (updated) {
                    Part imagePart = request.getPart("room_image");
                    if (imagePart != null && imagePart.getSize() > 0) {
                        String uploadPath = getServletContext().getRealPath("/") + "assets/rooms/";
                        File dir = new File(uploadPath);
                        if (!dir.exists()) dir.mkdirs();
                        imagePart.write(uploadPath + File.separator + roomId + ".jpg");
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/room");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update room.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to process form.");
        }
    }
}