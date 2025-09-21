package com.tsbs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=TrainBookingDB;encrypt=true;trustServerCertificate=true;";
    private static final String USER = "sa"; // 👈 replace with your SQL username
    private static final String PASSWORD = "your_password"; // 👈 replace with your SQL password

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
