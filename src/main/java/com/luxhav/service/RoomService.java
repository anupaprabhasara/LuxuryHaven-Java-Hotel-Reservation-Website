package com.luxhav.service;

import com.luxhav.model.Room;
import com.luxhav.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    // Create Room
    public boolean createRoom(Room room) {
        String query = "INSERT INTO rooms (room_number, room_type, price_per_night, status) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, room.getRoomNumber());
            stmt.setString(2, room.getRoomType());
            stmt.setDouble(3, room.getPricePerNight());
            stmt.setString(4, room.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Room by ID
    public Room getRoomById(int roomId) {
        String query = "SELECT * FROM rooms WHERE room_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, roomId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPricePerNight(rs.getDouble("price_per_night"));
                room.setStatus(rs.getString("status"));
                return room;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Rooms
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String query = "SELECT * FROM rooms ORDER BY room_number";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setPricePerNight(rs.getDouble("price_per_night"));
                room.setStatus(rs.getString("status"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // Update Room
    public boolean updateRoom(Room room) {
        String query = "UPDATE rooms SET room_number = ?, room_type = ?, price_per_night = ?, status = ? WHERE room_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, room.getRoomNumber());
            stmt.setString(2, room.getRoomType());
            stmt.setDouble(3, room.getPricePerNight());
            stmt.setString(4, room.getStatus());
            stmt.setInt(5, room.getRoomId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Room
    public boolean deleteRoom(int roomId) {
        String query = "DELETE FROM rooms WHERE room_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, roomId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}