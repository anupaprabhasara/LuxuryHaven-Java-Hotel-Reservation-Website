package com.luxhav.service;

import com.luxhav.model.Reservation;
import com.luxhav.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationService {

    // Create Reservation
    public boolean createReservation(Reservation reservation) {
        String query = "INSERT INTO reservations (user_id, room_id, check_in_date, check_out_date, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, reservation.getUserId());
            stmt.setInt(2, reservation.getRoomId());
            stmt.setString(3, reservation.getCheckInDate());
            stmt.setString(4, reservation.getCheckOutDate());
            stmt.setString(5, reservation.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Update Reservation Status
    public boolean updateReservationStatus(int reservationId, String status) {
        String query = "UPDATE reservations SET status = ? WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, reservationId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Reservation by ID
    public Reservation getReservationById(int id) {
        String query = "SELECT * FROM reservation_details_view WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationId(rs.getInt("reservation_id"));
                reservation.setGuestName(rs.getString("guest_name"));
                reservation.setRoomNumber(rs.getString("room_number"));
                reservation.setRoomType(rs.getString("room_type"));
                reservation.setCheckInDate(rs.getString("check_in_date"));
                reservation.setCheckOutDate(rs.getString("check_out_date"));
                reservation.setStatus(rs.getString("status"));
                reservation.setCreatedAt(rs.getString("created_at"));
                return reservation;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Reservations
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        String query = "SELECT * FROM reservation_details_view ORDER BY reservation_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationId(rs.getInt("reservation_id"));
                reservation.setGuestName(rs.getString("guest_name"));
                reservation.setRoomNumber(rs.getString("room_number"));
                reservation.setRoomType(rs.getString("room_type"));
                reservation.setCheckInDate(rs.getString("check_in_date"));
                reservation.setCheckOutDate(rs.getString("check_out_date"));
                reservation.setStatus(rs.getString("status"));
                reservation.setCreatedAt(rs.getString("created_at"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    // Update Reservation
    public boolean updateReservation(Reservation reservation) {
        String query = "UPDATE reservations SET user_id = ?, room_id = ?, check_in_date = ?, check_out_date = ?, status = ? WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, reservation.getUserId());
            stmt.setInt(2, reservation.getRoomId());
            stmt.setString(3, reservation.getCheckInDate());
            stmt.setString(4, reservation.getCheckOutDate());
            stmt.setString(5, reservation.getStatus());
            stmt.setInt(6, reservation.getReservationId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Reservation
    public boolean deleteReservation(int id) {
        String query = "DELETE FROM reservations WHERE reservation_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}