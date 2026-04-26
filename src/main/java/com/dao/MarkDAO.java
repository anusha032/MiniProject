package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MarkDAO {

    public static Connection getConnection() throws Exception {

    	Class.forName("com.mysql.cj.jdbc.Driver");


    	Connection con = DriverManager.getConnection(
    			"jdbc:mysql://localhost:3306/markdb",
    			"root",
    			"Anusha@12");
        return con;
    }
}
