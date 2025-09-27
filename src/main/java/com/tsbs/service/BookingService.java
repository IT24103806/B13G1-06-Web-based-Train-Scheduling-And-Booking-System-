package com.tsbs.service;

import com.tsbs.util.DBConnection;
import com.tsbs.model.Booking;

import java.sql.*;

public class BookingService {

    // Call stored procedure: usp_BookSeat
    public String bookSeat(int userId, int scheduleId, String seatNo, double amount) {
        String err = null;
        try (Connection conn = DBConnection.getConnection()) {
            CallableStatement cs = conn.prepareCall("{call usp_BookSeat(?,?,?,?,?,?)}");
            cs.setInt(1, userId);
            cs.setInt(2, scheduleId);
            cs.setString(3, seatNo);
            cs.setDouble(4, amount);
            cs.registerOutParameter(5, Types.BIGINT);
            cs.registerOutParameter(6, Types.NVARCHAR);

            cs.execute();

            long bookingId = cs.getLong(5);
            err = cs.getString(6);

            if (err == null) {
                return "✅ Booking successful! Booking ID = " + bookingId;
            }
        } catch (SQLException e) {
            err = e.getMessage();
        }
        return "❌ Booking failed: " + err;
    }

    // Call stored procedure: usp_ConfirmBooking
    public String confirmBooking(long bookingId, String txnId) {
        try (Connection conn = DBConnection.getConnection()) {
            CallableStatement cs = conn.prepareCall("{call usp_ConfirmBooking(?,?)}");
            cs.setLong(1, bookingId);
            cs.setString(2, txnId);
            cs.execute();
            return "✅ Booking confirmed! Booking ID = " + bookingId;
        } catch (SQLException e) {
            return "❌ Confirm failed: " + e.getMessage();
        }
    }

    // Call stored procedure: usp_CancelBooking
    public String cancelBooking(long bookingId) {
        try (Connection conn = DBConnection.getConnection()) {
            CallableStatement cs = conn.prepareCall("{call usp_CancelBooking(?)}");
            cs.setLong(1, bookingId);
            cs.execute();
            return "✅ Booking cancelled! Booking ID = " + bookingId;
        } catch (SQLException e) {
            return "❌ Cancel failed: " + e.getMessage();
        }
    }
}
