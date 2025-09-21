package com.tsbs.service;

import com.tsbs.dao.PaymentDAO;
import com.tsbs.model.Payment;

public class PaymentService {
    private final PaymentDAO paymentDAO = new PaymentDAO();

    // Get payment by booking
    public Payment getPaymentByBooking(long bookingId) {
        return paymentDAO.getPaymentByBooking(bookingId);
    }

    // Example: simple validation wrapper
    public String checkPaymentStatus(long bookingId) {
        Payment p = paymentDAO.getPaymentByBooking(bookingId);
        if (p == null) {
            return "❌ No payment record found for booking " + bookingId;
        }
        if ("SUCCESS".equalsIgnoreCase(p.getStatus())) {
            return "✅ Payment successful for booking " + bookingId;
        } else if ("FAILED".equalsIgnoreCase(p.getStatus())) {
            return "⚠️ Payment failed for booking " + bookingId;
        } else {
            return "⌛ Payment still pending for booking " + bookingId;
        }
    }
}
