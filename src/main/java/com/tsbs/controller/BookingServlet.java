package com.tsbs.controller;

import com.tsbs.service.BookingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private final BookingService bookingService = new BookingService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        int scheduleId = Integer.parseInt(request.getParameter("scheduleId"));
        String seatNo = request.getParameter("seatNo");
        double amount = Double.parseDouble(request.getParameter("amount"));

        String result = bookingService.bookSeat(userId, scheduleId, seatNo, amount);

        request.setAttribute("resultMessage", result);
        request.getRequestDispatcher("bookingResult.jsp").forward(request, response);
    }
}
