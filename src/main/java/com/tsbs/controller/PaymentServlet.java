package com.tsbs.controller;

import com.tsbs.service.PaymentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class PaymentServlet extends HttpServlet {

    private PaymentService paymentService;

    @Override
    public void init() throws ServletException {
        paymentService = new PaymentService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long bookingId = Long.parseLong(request.getParameter("bookingId"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String method = request.getParameter("method");

            boolean success = paymentService.makePayment(bookingId, amount, method);

            if (success) {
                request.setAttribute("message", "Payment successful! Booking is now CONFIRMED.");
                request.getRequestDispatcher("/views/Booking&Payment/paymentResult.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Payment failed. Try again.");
                request.getRequestDispatcher("/views/Booking&Payment/paymentResult.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("/views/Booking&Payment/paymentResult.jsp").forward(request, response);
        }
    }
}
