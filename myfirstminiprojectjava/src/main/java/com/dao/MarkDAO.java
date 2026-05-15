package com.dao;
import java.sql.*;

public class MarkDAO {

    public static Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/MarkWebApp",
        "root",
        "Anusha@12");
    }
}
