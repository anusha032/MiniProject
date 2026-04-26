package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String type = request.getParameter("type");
            String value = request.getParameter("value");

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps = null;

            // 🔥 ABOVE MARKS
            if ("above".equals(type)) {

                ps = con.prepareStatement(
                    "SELECT * FROM StudentMarks WHERE Marks > ?"
                );
                ps.setInt(1, Integer.parseInt(value));

            }

            // 🔥 SUBJECT WISE
            else if ("subject".equals(type)) {

                ps = con.prepareStatement(
                    "SELECT * FROM StudentMarks WHERE Subject = ?"
                );
                ps.setString(1, value);

            }

            // 🔥 TOP N STUDENTS
            else if ("top".equals(type)) {

                ps = con.prepareStatement(
                    "SELECT * FROM StudentMarks ORDER BY Marks DESC LIMIT ?"
                );
                ps.setInt(1, Integer.parseInt(value));
            }

            ResultSet rs = ps.executeQuery();

            // 🎨 OUTPUT UI
            out.println("<html><head><style>");
            out.println("body{font-family:Arial;background:linear-gradient(to right,#141e30,#243b55);color:white;}");
            out.println("table{width:80%;margin:auto;border-collapse:collapse;background:white;color:black;}");
            out.println("th,td{padding:10px;text-align:center;border:1px solid #ddd;}");
            out.println("th{background:#2ebf91;color:white;}");
            out.println("h2{text-align:center;}");
            out.println("</style></head><body>");

            out.println("<h2>Report Result</h2>");

            out.println("<table>");
            out.println("<tr><th>ID</th><th>Name</th><th>Subject</th><th>Marks</th><th>Date</th></tr>");

            boolean found = false;

            while(rs.next()) {
                found = true;
                out.println("<tr>");
                out.println("<td>"+rs.getInt(1)+"</td>");
                out.println("<td>"+rs.getString(2)+"</td>");
                out.println("<td>"+rs.getString(3)+"</td>");
                out.println("<td>"+rs.getInt(4)+"</td>");
                out.println("<td>"+rs.getDate(5)+"</td>");
                out.println("</tr>");
            }

            if(!found) {
                out.println("<tr><td colspan='5' style='color:red;'>No Data Found</td></tr>");
            }

            out.println("</table>");

            out.println("</body></html>");

            con.close();

        } catch(Exception e) {
            out.println("<h3 style='color:red;text-align:center;'>Error: " + e + "</h3>");
        }
    }
}
