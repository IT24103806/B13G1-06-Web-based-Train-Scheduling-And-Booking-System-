package com.tsbs.controller;

import com.tsbs.service.BookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ConfirmBookingServlet extends HttpServlet {

    private BookingService bookingService;

    @Override
    public void init() throws ServletException {
        bookingService = new BookingService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long bookingId = Long.parseLong(request.getParameter("bookingId"));
            String txnId = "TXN" + System.currentTimeMillis();

            boolean success = Boolean.parseBoolean(bookingService.confirmBooking(bookingId, txnId));

            if (success) {
                request.setAttribute("message", "Booking confirmed successfully!");
                request.getRequestDispatcher("/views/Booking&Payment/confirmBooking.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Booking confirmation failed.");
                request.getRequestDispatcher("/views/Booking&Payment/confirmBooking.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("/views/Booking&Payment/confirmBooking.jsp").forward(request, response);
        }
    }
}
