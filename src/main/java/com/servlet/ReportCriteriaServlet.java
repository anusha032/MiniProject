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

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String subject = request.getParameter("subject");
            String marks = request.getParameter("marks");

            Connection con = MarkDAO.getConnection();

            // 🔥 Base query
            StringBuilder sql = new StringBuilder("SELECT * FROM StudentMarks WHERE 1=1");

            // dynamic conditions
            if(subject != null && !subject.trim().isEmpty()) {
                sql.append(" AND Subject = ?");
            }

            if(marks != null && !marks.trim().isEmpty()) {
                sql.append(" AND Marks >= ?");
            }

            PreparedStatement ps = con.prepareStatement(sql.toString());

            int index = 1;

            if(subject != null && !subject.trim().isEmpty()) {
                ps.setString(index++, subject);
            }

            if(marks != null && !marks.trim().isEmpty()) {
                ps.setInt(index++, Integer.parseInt(marks));
            }

            ResultSet rs = ps.executeQuery();

            // 🎨 UI DESIGN
            out.println("<html><head><style>");
            out.println("body{font-family:Arial;background:linear-gradient(to right,#0f2027,#203a43,#2c5364);color:white;}");
            out.println("table{width:80%;margin:auto;border-collapse:collapse;background:white;color:black;}");
            out.println("th,td{padding:10px;text-align:center;border:1px solid #ddd;}");
            out.println("th{background:#36d1dc;color:white;}");
            out.println("h2{text-align:center;}");
            out.println("</style></head><body>");

            out.println("<h2>Advanced Report Result</h2>");

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
                out.println("<tr><td colspan='5' style='color:red;'>No Records Found</td></tr>");
            }

            out.println("</table>");

            out.println("</body></html>");

            con.close();

        } catch(Exception e) {
            out.println("<h3 style='color:red;text-align:center;'>Error: " + e + "</h3>");
        }
    }
}
