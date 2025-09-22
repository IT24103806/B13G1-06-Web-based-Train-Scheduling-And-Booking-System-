package com.tsbs.controller;

import com.tsbs.model.Booking;
import com.tsbs.service.BookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class BookingServlet extends HttpServlet {

    private BookingService bookingService;

    @Override
    public void init() throws ServletException {
        bookingService = new BookingService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));  // from session ideally
            int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
            String seatNo = request.getParameter("seatNo");
            double amount = Double.parseDouble(request.getParameter("amount"));

            String booking = bookingService.bookSeat(userId, scheduleId, seatNo, amount);

            if (booking != null) {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Booking failed! Try another seat.");
                request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
        }
    }
}
