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

            StringBuilder sql =
            new StringBuilder("select * from StudentMarks where 1=1");

            if(subject != null && !subject.trim().equals("")) {
                sql.append(" and Subject=?");
            }

            if(marks != null && !marks.trim().equals("")) {
                sql.append(" and Marks>=?");
            }

            PreparedStatement ps =
            con.prepareStatement(sql.toString());

            int index = 1;

            if(subject != null && !subject.trim().equals("")) {
                ps.setString(index++, subject);
            }

            if(marks != null && !marks.trim().equals("")) {
                ps.setInt(index++, Integer.parseInt(marks));
            }

            ResultSet rs = ps.executeQuery();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Advanced Report</title>");

            out.println("<style>");
            out.println("body{margin:0;font-family:Arial;background:linear-gradient(135deg,#1e3c72,#2a5298);padding:40px;}");
            out.println(".box{background:white;width:90%;margin:auto;padding:30px;border-radius:22px;box-shadow:0 15px 35px rgba(0,0,0,0.25);}");
            out.println("h2{text-align:center;color:#1e3c72;margin-bottom:25px;}");
            out.println("table{width:100%;border-collapse:collapse;text-align:center;}");
            out.println("th{background:#1e3c72;color:white;padding:12px;}");
            out.println("td{padding:12px;border-bottom:1px solid #ddd;}");
            out.println("tr:hover{background:#f5f5f5;}");
            out.println("a{display:block;text-align:center;margin-top:20px;text-decoration:none;font-weight:bold;color:#1e3c72;}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");

            out.println("<h2>Advanced Report Result</h2>");

            out.println("<table>");

            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Name</th>");
            out.println("<th>Subject</th>");
            out.println("<th>Marks</th>");
            out.println("<th>Exam Date</th>");
            out.println("</tr>");

            boolean found = false;

            while(rs.next()) {

                found = true;

                out.println("<tr>");
                out.println("<td>" + rs.getInt(1) + "</td>");
                out.println("<td>" + rs.getString(2) + "</td>");
                out.println("<td>" + rs.getString(3) + "</td>");
                out.println("<td>" + rs.getInt(4) + "</td>");
                out.println("<td>" + rs.getDate(5) + "</td>");
                out.println("</tr>");
            }

            if(!found) {

                out.println("<tr>");
                out.println("<td colspan='5' style='color:red;'>No Records Found</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            out.println("<a href='report_form.jsp'>Back</a>");
            out.println("<a href='index.jsp'>Home</a>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e) {

            out.println("<h3 style='color:red;text-align:center;'>Error : " + e + "</h3>");
        }
    }
}
