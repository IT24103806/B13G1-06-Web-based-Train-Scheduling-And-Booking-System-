package com.tsbs.dao;

import com.tsbs.model.Booking;
import com.tsbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public Booking getBookingById(long bookingId) {
        Booking booking = null;
        String sql = "SELECT * FROM Booking WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                booking = new Booking(
                        rs.getLong("booking_id"),
                        rs.getInt("user_id"),
                        rs.getInt("schedule_id"),
                        rs.getObject("seat_id", Integer.class),
                        rs.getString("pnr"),
                        rs.getTimestamp("booking_time").toLocalDateTime(),
                        rs.getString("status"),
                        rs.getDouble("total_amount")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }

    public List<Booking> getBookingsByUser(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                bookings.add(new Booking(
                        rs.getLong("booking_id"),
                        rs.getInt("user_id"),
                        rs.getInt("schedule_id"),
                        rs.getObject("seat_id", Integer.class),
                        rs.getString("pnr"),
                        rs.getTimestamp("booking_time").toLocalDateTime(),
                        rs.getString("status"),
                        rs.getDouble("total_amount")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
