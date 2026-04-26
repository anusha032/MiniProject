package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;

@WebServlet("/UpdateMarkServlet")
public class UpdateMarkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            int marks = Integer.parseInt(request.getParameter("marks"));

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE StudentMarks SET Marks=? WHERE StudentID=?"
            );

            ps.setInt(1, marks);
            ps.setInt(2, id);

            int result = ps.executeUpdate();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Update Result</title>");
            out.println("</head>");

            out.println("<body style='font-family:Arial;background:linear-gradient(to right,#8360c3,#2ebf91);'>");

            out.println("<div style='width:400px;margin:auto;margin-top:80px;padding:25px;background:white;border-radius:15px;box-shadow:0px 0px 15px rgba(0,0,0,0.3);text-align:center;'>");

            if (result > 0) {
                out.println("<h2 style='color:#28a745;'>✔ Record Updated Successfully</h2>");
                out.println("<p style='color:#555;'>Student marks have been updated in the database.</p>");
            } else {
                out.println("<h2 style='color:#dc3545;'>✖ Record Not Found</h2>");
                out.println("<p style='color:#555;'>Please check Student ID.</p>");
            }

            out.println("<br><a href='update.jsp' style='background:#007bff;color:white;padding:10px 15px;text-decoration:none;border-radius:8px;'>Try Again</a>");
            out.println("<br><br><a href='view.jsp' style='color:#2ebf91;text-decoration:none;'>View Records</a>");
            out.println("<br><br><a href='index.jsp' style='color:#8360c3;text-decoration:none;'>Home</a>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch (Exception e) {

            out.println("<div style='color:red;text-align:center;font-size:18px;'>Error: " + e + "</div>");
        }
    }
}
