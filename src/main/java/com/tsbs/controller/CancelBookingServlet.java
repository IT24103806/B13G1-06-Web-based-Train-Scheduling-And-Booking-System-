package com.tsbs.controller;

import com.tsbs.service.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private final BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        long bookingId = Long.parseLong(request.getParameter("bookingId"));

        String result = bookingService.cancelBooking(bookingId);

        request.setAttribute("resultMessage", result);
        request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
    }
}
