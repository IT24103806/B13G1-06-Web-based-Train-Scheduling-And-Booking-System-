package com.tsbs.dao;

import com.tsbs.model.Feedback;
import com.tsbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class FeedbackDAO {

    public boolean insertFeedback(Feedback feedback) {
        String sql = "INSERT INTO Feedback (user_id, subject, message, status, created_at) VALUES (?,?,?,?, GETDATE())";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, feedback.getUserId());
            ps.setString(2, feedback.getSubject());
            ps.setString(3, feedback.getMessage());
            ps.setString(4, feedback.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean createFeedback(int userId, String subject, String message, int rating, String category) {
        String sql = "INSERT INTO Feedback (user_id, subject, message, rating, category, status, created_at) VALUES (?,?,?,?,?,'PENDING', GETDATE())";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, subject);
            ps.setString(3, message);
            ps.setInt(4, rating);
            ps.setString(5, category);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Feedback getFeedbackById(int feedbackId) {
        Feedback feedback = null;
        String sql = "SELECT * FROM Feedback WHERE feedback_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                feedback = new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating"),
                        rs.getString("category"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedback;
    }

    public List<Feedback> getFeedbackByUser(int userId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE user_id = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating"),
                        rs.getString("category"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Feedback> getFeedbackByCategory(String category) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE category = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating"),
                        rs.getString("category"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Feedback> getFeedbackByRating(int rating) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE rating = ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, rating);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating"),
                        rs.getString("category"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Feedback> getRecentFeedback(int limit) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT TOP " + limit + " * FROM Feedback ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating"),
                        rs.getString("category"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateFeedback(int feedbackId, String subject, String message, int rating, String category) {
        String sql = "UPDATE Feedback SET subject = ?, message = ?, rating = ?, category = ? WHERE feedback_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, subject);
            ps.setString(2, message);
            ps.setInt(3, rating);
            ps.setString(4, category);
            ps.setInt(5, feedbackId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteFeedback(int feedbackId) {
        String sql = "DELETE FROM Feedback WHERE feedback_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Map<String, Object> getFeedbackStats() {
        Map<String, Object> stats = new HashMap<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) as count FROM Feedback";
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.put("totalFeedback", rs.getInt("count"));
                }
            }

            String avgSql = "SELECT AVG(CAST(rating AS FLOAT)) as avgRating FROM Feedback WHERE rating IS NOT NULL";
            try (PreparedStatement ps = conn.prepareStatement(avgSql);
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.put("averageRating", rs.getDouble("avgRating"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }

    public double getAverageRating() {
        double avgRating = 0.0;
        String sql = "SELECT AVG(CAST(rating AS FLOAT)) as avgRating FROM Feedback WHERE rating IS NOT NULL";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                avgRating = rs.getDouble("avgRating");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return avgRating;
    }

    public Map<Integer, Integer> getRatingDistribution() {
        Map<Integer, Integer> distribution = new HashMap<>();
        String sql = "SELECT rating, COUNT(*) as count FROM Feedback WHERE rating IS NOT NULL GROUP BY rating ORDER BY rating";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                distribution.put(rs.getInt("rating"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return distribution;
    }

    public Map<String, Integer> getFeedbackCountByCategory() {
        Map<String, Integer> countByCategory = new HashMap<>();
        String sql = "SELECT category, COUNT(*) as count FROM Feedback GROUP BY category ORDER BY category";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                countByCategory.put(rs.getString("category"), rs.getInt("count"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return countByCategory;
    }

    public int getFeedbackCountByUser(int userId) {
        int count = 0;
        String sql = "SELECT COUNT(*) as count FROM Feedback WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Feedback> searchFeedback(String keyword) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT * FROM Feedback WHERE subject LIKE ? OR message LIKE ? ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String searchTerm = "%" + keyword + "%";
            ps.setString(1, searchTerm);
            ps.setString(2, searchTerm);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("feedback_id"),
                        rs.getInt("user_id"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getInt("rating"),
                        rs.getString("category"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Map<String, Object> getFeedbackWithUserDetails(int feedbackId) {
        Map<String, Object> details = new HashMap<>();
        String sql = "SELECT f.*, u.name as user_name, u.email as user_email FROM Feedback f JOIN [User] u ON f.user_id = u.user_id WHERE f.feedback_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, feedbackId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                details.put("feedbackId", rs.getLong("feedback_id"));
                details.put("userId", rs.getInt("user_id"));
                details.put("subject", rs.getString("subject"));
                details.put("message", rs.getString("message"));
                details.put("rating", rs.getInt("rating"));
                details.put("category", rs.getString("category"));
                details.put("status", rs.getString("status"));
                details.put("createdAt", rs.getTimestamp("created_at"));
                details.put("userName", rs.getString("user_name"));
                details.put("userEmail", rs.getString("user_email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }

    public List<Map<String, Object>> getAllFeedbackWithUserDetails() {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT f.*, u.name as user_name, u.email as user_email FROM Feedback f JOIN [User] u ON f.user_id = u.user_id ORDER BY f.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, Object> details = new HashMap<>();
                details.put("feedbackId", rs.getLong("feedback_id"));
                details.put("userId", rs.getInt("user_id"));
                details.put("subject", rs.getString("subject"));
                details.put("message", rs.getString("message"));
                details.put("rating", rs.getInt("rating"));
                details.put("category", rs.getString("category"));
                details.put("status", rs.getString("status"));
                details.put("createdAt", rs.getTimestamp("created_at"));
                details.put("userName", rs.getString("user_name"));
                details.put("userEmail", rs.getString("user_email"));
                list.add(details);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}


