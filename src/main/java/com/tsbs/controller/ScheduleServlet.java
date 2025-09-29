package com.tsbs.controller;

import com.tsbs.dao.ScheduleDAO;
import com.tsbs.dao.TrainDAO;
import com.tsbs.model.Schedule;
import com.tsbs.model.Train;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class ScheduleServlet extends HttpServlet {

    private final TrainDAO trainDAO = new TrainDAO();
    private final ScheduleDAO scheduleDAO = new ScheduleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String trainIdParam = request.getParameter("trainId");
        if (trainIdParam != null) {
            int trainId = Integer.parseInt(trainIdParam);
            List<Schedule> schedules = scheduleDAO.getSchedulesByTrain(trainId);
            request.setAttribute("schedules", schedules);
        }
        List<Train> trains = trainDAO.getAllTrains();
        request.setAttribute("trains", trains);
        request.getRequestDispatcher("/views/schedule/browse.jsp").forward(request, response);
    }
}


