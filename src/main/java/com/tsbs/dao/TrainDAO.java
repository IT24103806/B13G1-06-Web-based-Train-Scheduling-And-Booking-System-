package com.tsbs.dao;

import com.tsbs.model.Train;
import com.tsbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainDAO {
    public List<Train> getAllTrains() {
        List<Train> trains = new ArrayList<>();
        String sql = "SELECT * FROM Train";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                trains.add(new Train(
                        rs.getInt("train_id"),
                        rs.getString("name"),
                        rs.getString("type")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trains;
    }
}
