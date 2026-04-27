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

            if ("above".equals(type)) {

                ps = con.prepareStatement(
                "select * from StudentMarks where Marks > ?");

                ps.setInt(1, Integer.parseInt(value));
            }

            else if ("subject".equals(type)) {

                ps = con.prepareStatement(
                "select * from StudentMarks where Subject = ?");

                ps.setString(1, value);
            }

            else if ("top".equals(type)) {

                ps = con.prepareStatement(
                "select * from StudentMarks order by Marks desc limit ?");

                ps.setInt(1, Integer.parseInt(value));
            }

            ResultSet rs = ps.executeQuery();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Reports</title>");

            out.println("<style>");
            out.println("body{margin:0;font-family:Arial;background:linear-gradient(135deg,#4b6cb7,#182848);padding:40px;}");
            out.println(".box{background:white;width:90%;margin:auto;padding:30px;border-radius:22px;box-shadow:0 15px 35px rgba(0,0,0,0.25);}");
            out.println("h2{text-align:center;color:#182848;margin-bottom:25px;}");
            out.println("table{width:100%;border-collapse:collapse;text-align:center;}");
            out.println("th{background:#4b6cb7;color:white;padding:12px;}");
            out.println("td{padding:12px;border-bottom:1px solid #ddd;}");
            out.println("tr:hover{background:#f5f5f5;}");
            out.println(".btn{display:inline-block;margin-top:20px;padding:12px 20px;background:#4b6cb7;color:white;text-decoration:none;border-radius:10px;font-weight:bold;}");
            out.println(".btn:hover{background:#182848;}");
            out.println(".center{text-align:center;}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");

            out.println("<h2>Report Result</h2>");

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
                out.println("<td colspan='5' style='color:red;'>No Data Found</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            out.println("<div class='center'>");
            out.println("<a href='reports.jsp' class='btn'>Back</a>");
            out.println("&nbsp;&nbsp;");
            out.println("<a href='index.jsp' class='btn'>Home</a>");
            out.println("</div>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e) {

            out.println("<h3 style='color:red;text-align:center;'>Error : " + e + "</h3>");
        }
    }
}
