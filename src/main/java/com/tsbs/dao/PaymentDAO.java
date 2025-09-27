package com.tsbs.dao;

import com.tsbs.model.Payment;
import com.tsbs.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {

    public Payment getPaymentByBooking(long bookingId) {
        Payment payment = null;
        String sql = "SELECT * FROM Payment WHERE booking_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                payment = new Payment(
                        rs.getLong("payment_id"),
                        rs.getLong("booking_id"),
                        rs.getDouble("amount"),
                        rs.getString("method"),
                        rs.getString("status"),
                        rs.getString("gateway_txn_id"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM Payment";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                payments.add(new Payment(
                        rs.getLong("payment_id"),
                        rs.getLong("booking_id"),
                        rs.getDouble("amount"),
                        rs.getString("method"),
                        rs.getString("status"),
                        rs.getString("gateway_txn_id"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    // ✅ New method: Insert a payment
    public boolean insertPayment(Payment payment) {
        String sql = "INSERT INTO Payment (booking_id, amount, method, status, gateway_txn_id, created_at) " +
                "VALUES (?, ?, ?, ?, ?, GETDATE())";  // GETDATE() for SQL Server current time
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, payment.getBookingId());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getMethod());
            ps.setString(4, payment.getStatus());
            ps.setString(5, payment.getGatewayTxnId());

            int rows = ps.executeUpdate();
            return rows > 0; // true if inserted
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
