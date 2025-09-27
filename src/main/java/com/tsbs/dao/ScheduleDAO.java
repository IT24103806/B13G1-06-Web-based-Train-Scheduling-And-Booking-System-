package com.tsbs.dao;

import com.tsbs.model.Schedule;
import com.tsbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDAO {
    public List<Schedule> getSchedulesByTrain(int trainId) {
        List<Schedule> schedules = new ArrayList<>();
        String sql = "SELECT * FROM Schedule WHERE train_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, trainId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                schedules.add(new Schedule(
                        rs.getInt("schedule_id"),
                        rs.getInt("train_id"),
                        rs.getString("departure_station"),
                        rs.getString("arrival_station"),
                        rs.getTimestamp("departure_time").toLocalDateTime(),
                        rs.getTimestamp("arrival_time").toLocalDateTime(),
                        rs.getInt("total_seats")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }
}
