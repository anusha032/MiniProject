package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MarkDAO;

@WebServlet("/FetchMarkServlet")
public class FetchMarkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps =
            con.prepareStatement(
            "SELECT * FROM StudentMarks WHERE StudentID=?");

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                request.setAttribute("id",
                rs.getInt("StudentID"));

                request.setAttribute("name",
                rs.getString("StudentName"));

                request.setAttribute("subject",
                rs.getString("Subject"));

                request.setAttribute("oldMarks",
                rs.getInt("Marks"));

                request.setAttribute("date",
                rs.getDate("ExamDate"));

            } else {

                request.setAttribute("msg",
                "Student Record Not Found");

            }

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd =
        request.getRequestDispatcher("markupdate.jsp");

        rd.forward(request, response);
    }
}