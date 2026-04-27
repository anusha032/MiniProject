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

            String idStr = request.getParameter("id");
            String marksStr = request.getParameter("marks");

            if(idStr.equals("") || marksStr.equals("")) {
                out.println("<h2>All fields are required</h2>");
                return;
            }

            int id = Integer.parseInt(idStr);
            int marks = Integer.parseInt(marksStr);

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps = con.prepareStatement(
            "update StudentMarks set Marks=? where StudentID=?");

            ps.setInt(1, marks);
            ps.setInt(2, id);

            int result = ps.executeUpdate();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Update Result</title>");

            out.println("<style>");
            out.println("body{margin:0;font-family:Arial;background:linear-gradient(135deg,#8E2DE2,#4A00E0);height:100vh;display:flex;justify-content:center;align-items:center;}");
            out.println(".box{background:white;width:450px;padding:35px;border-radius:22px;box-shadow:0 15px 35px rgba(0,0,0,0.25);text-align:center;}");
            out.println("h2{margin-bottom:15px;}");
            out.println("p{color:#555;font-size:16px;}");
            out.println("a{display:block;text-decoration:none;margin-top:15px;font-weight:bold;color:#4A00E0;}");
            out.println("a:hover{color:#8E2DE2;}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");

            if(result > 0) {

                out.println("<h2 style='color:green;'>Record Updated Successfully</h2>");
                out.println("<p>Student marks updated in database.</p>");

            } else {

                out.println("<h2 style='color:red;'>Record Not Found</h2>");
                out.println("<p>Please check Student ID.</p>");
            }

            out.println("<a href='markupdate.jsp'>Update Again</a>");
            out.println("<a href='markdisplay.jsp'>View Records</a>");
            out.println("<a href='index.jsp'>Back to Home</a>");

            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e) {

            out.println("<h3 style='color:red;text-align:center;'>Error : " + e + "</h3>");
        }
    }
}
