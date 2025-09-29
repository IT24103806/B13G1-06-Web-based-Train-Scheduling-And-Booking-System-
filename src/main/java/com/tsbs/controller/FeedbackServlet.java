package com.tsbs.controller;

import com.tsbs.dao.FeedbackDAO;
import com.tsbs.model.Feedback;
import com.tsbs.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class FeedbackServlet extends HttpServlet {

    private final FeedbackDAO feedbackDAO = new FeedbackDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("list".equalsIgnoreCase(action)) {
            List<Feedback> list = feedbackDAO.getAllFeedback();
            request.setAttribute("feedbackList", list);
            request.getRequestDispatcher("/views/feedback/list.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/feedback/create.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        HttpSession session = request.getSession(false);
        User user = session != null ? (User) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
            return;
        }

        Feedback f = new Feedback();
        f.setUserId(user.getUserId());
        f.setSubject(subject);
        f.setMessage(message);
        f.setStatus("NEW");

        boolean ok = feedbackDAO.insertFeedback(f);
        if (ok) {
            request.setAttribute("message", "Feedback submitted. Thank you!");
        } else {
            request.setAttribute("error", "Failed to submit feedback");
        }
        request.getRequestDispatcher("/views/feedback/create.jsp").forward(request, response);
    }
}


