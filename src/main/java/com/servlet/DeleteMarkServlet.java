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

@WebServlet("/DeleteMarkServlet")
public class DeleteMarkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String idStr = request.getParameter("id");

            if(idStr == null || idStr.equals("")) {
                out.println("<h2>Student ID is required</h2>");
                return;
            }

            int id = Integer.parseInt(idStr);

            Connection con = MarkDAO.getConnection();

            // FETCH RECORD BEFORE DELETE
            PreparedStatement ps1 = con.prepareStatement(
                    "select * from StudentMarks where StudentID=?");
            ps1.setInt(1, id);

            ResultSet rs = ps1.executeQuery();

            String name = "";
            String subject = "";
            int marks = 0;
            String date = "";

            if(rs.next()) {
                name = rs.getString("StudentName");
                subject = rs.getString("Subject");
                marks = rs.getInt("Marks");
                date = rs.getString("ExamDate");
            } else {
                out.println("<h2>Student ID Not Found</h2>");
                return;
            }

            // DELETE RECORD
            PreparedStatement ps2 = con.prepareStatement(
                    "delete from StudentMarks where StudentID=?");
            ps2.setInt(1, id);

            int x = ps2.executeUpdate();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Delete Result</title>");

            out.println("<style>");
            out.println("body{margin:0;font-family:Arial;background:linear-gradient(135deg,#ff512f,#dd2476);height:100vh;display:flex;justify-content:center;align-items:center;}");
            out.println(".box{background:white;width:430px;padding:35px;border-radius:22px;box-shadow:0 15px 35px rgba(0,0,0,0.25);text-align:center;}");
            out.println("h2{margin-bottom:20px;}");
            out.println("p{font-size:18px;color:#333;margin:8px 0;}");
            out.println("a{display:block;text-decoration:none;margin-top:15px;font-weight:bold;color:#dd2476;}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");
            out.println("<div class='box'>");

            if(x > 0) {
                out.println("<h2 style='color:green;'>Record Deleted Successfully</h2>");
                out.println("<p><b>ID:</b> " + id + "</p>");
                out.println("<p><b>Name:</b> " + name + "</p>");
                out.println("<p><b>Subject:</b> " + subject + "</p>");
                out.println("<p><b>Marks:</b> " + marks + "</p>");
                out.println("<p><b>Date:</b> " + date + "</p>");
            } else {
                out.println("<h2 style='color:red;'>Delete Failed</h2>");
            }

            out.println("<a href='markdelete.jsp'>Delete Another Record</a>");
            out.println("<a href='index.jsp'>Back to Home</a>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e) {
            out.println("<h3 style='color:red;text-align:center;'>" + e + "</h3>");
        }
    }
}