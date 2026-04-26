package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;

@WebServlet("/DisplayMarksServlet")
public class DisplayMarksServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            Connection con = MarkDAO.getConnection();
            Statement st = con.createStatement();

            String idParam = request.getParameter("id");

            ResultSet rs;

            // 🔥 IF USER ENTERS ID → SEARCH THAT RECORD ONLY
            if (idParam != null && !idParam.trim().isEmpty()) {

                int id = Integer.parseInt(idParam);

                rs = st.executeQuery(
                    "SELECT * FROM StudentMarks WHERE StudentID = " + id
                );

            } else {

                // 🔥 ELSE SHOW ALL RECORDS
                rs = st.executeQuery("SELECT * FROM StudentMarks");
            }

            out.println("<html><body style='font-family:Arial;'>");

            out.println("<h2 style='text-align:center;'>Student Marks</h2>");

            out.println("<table border='1' style='width:80%;margin:auto;text-align:center;border-collapse:collapse;'>");

            out.println("<tr style='background:#2ebf91;color:white;'>");
            out.println("<th>ID</th><th>Name</th><th>Subject</th><th>Marks</th><th>Date</th>");
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
                out.println("<tr><td colspan='5' style='color:red;'>No Record Found</td></tr>");
            }

            out.println("</table>");

            out.println("<div style='text-align:center;margin-top:20px;'>");
            out.println("<a href='display.jsp'>Back</a>");
            out.println("</div>");

            out.println("</body></html>");

            con.close();

        } catch(Exception e) {
            out.println("<h3 style='color:red;text-align:center;'>" + e + "</h3>");
        }
    }
}
