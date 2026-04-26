package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

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

            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM StudentMarks WHERE StudentID=?"
            );

            ps.setInt(1, id);

            int result = ps.executeUpdate();

            out.println("<html>");
            out.println("<body style='font-family:Arial;background:linear-gradient(135deg,#ff416c,#ff4b2b);'>");

            out.println("<div style='width:400px;margin:auto;margin-top:80px;background:white;padding:30px;border-radius:15px;text-align:center;box-shadow:0px 0px 15px rgba(0,0,0,0.3);'>");

            if (result > 0) {
                out.println("<h2 style='color:green;'>✔ Record Deleted Successfully</h2>");
            } else {
                out.println("<h2 style='color:red;'>✖ Record Not Found</h2>");
            }

            out.println("<br><a href='delete.jsp' style='background:#ff4b2b;color:white;padding:10px 15px;text-decoration:none;border-radius:8px;'>Try Again</a>");
            out.println("<br><br><a href='view.jsp' style='color:#ff4b2b;text-decoration:none;'>View Records</a>");
            out.println("<br><br><a href='index.jsp' style='color:#333;text-decoration:none;'>Home</a>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch (Exception e) {
            out.println("<h3 style='color:white;text-align:center;'>Error: " + e + "</h3>");
        }
    }
}
