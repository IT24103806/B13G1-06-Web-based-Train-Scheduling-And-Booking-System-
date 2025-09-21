package com.tsbs.dao;

import com.tsbs.model.Seat;
import com.tsbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeatDAO {
    public List<Seat> getSeatsBySchedule(int scheduleId) {
        List<Seat> seats = new ArrayList<>();
        String sql = "SELECT * FROM Seat WHERE schedule_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, scheduleId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                seats.add(new Seat(
                        rs.getInt("seat_id"),
                        rs.getInt("schedule_id"),
                        rs.getString("seat_no"),
                        rs.getString("class")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seats;
    }
}
