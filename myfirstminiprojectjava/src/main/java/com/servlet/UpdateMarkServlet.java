package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

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

            int id =
            Integer.parseInt(request.getParameter("id"));

            int newMarks =
            Integer.parseInt(request.getParameter("marks"));

            Connection con = MarkDAO.getConnection();

            /* GET OLD RECORD */

            PreparedStatement ps1 =
            con.prepareStatement(
            "SELECT * FROM StudentMarks WHERE StudentID=?");

            ps1.setInt(1, id);

            ResultSet rs = ps1.executeQuery();

            String name = "";
            String subject = "";
            int oldMarks = 0;

            if(rs.next())
            {
                name = rs.getString("StudentName");
                subject = rs.getString("Subject");
                oldMarks = rs.getInt("Marks");
            }

            /* UPDATE MARKS */

            PreparedStatement ps2 =
            con.prepareStatement(
            "UPDATE StudentMarks SET Marks=? WHERE StudentID=?");

            ps2.setInt(1, newMarks);
            ps2.setInt(2, id);

            int x = ps2.executeUpdate();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Update Result</title>");

            out.println("<style>");

            out.println("body{font-family:Arial;background:linear-gradient(135deg,#ff9a9e,#fad0c4);height:100vh;display:flex;justify-content:center;align-items:center;}");

            out.println(".box{background:white;width:500px;padding:35px;border-radius:22px;box-shadow:0 15px 35px rgba(0,0,0,0.2);text-align:center;}");

            out.println("h2{color:#d63384;margin-bottom:20px;}");

            out.println("table{width:100%;border-collapse:collapse;margin-top:20px;}");

            out.println("td{padding:12px;border-bottom:1px solid #ddd;font-size:16px;}");

            out.println(".label{font-weight:bold;color:#444;}");

            out.println(".newMarks{color:green;font-weight:bold;}");

            out.println("a{display:inline-block;margin-top:25px;padding:12px 20px;background:#ff69b4;color:white;text-decoration:none;border-radius:10px;font-weight:bold;}");

            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");

            if(x > 0)
            {
                out.println("<h2>Marks Updated Successfully</h2>");

                out.println("<table>");

                out.println("<tr><td class='label'>Student ID</td><td>"
                + id + "</td></tr>");

                out.println("<tr><td class='label'>Student Name</td><td>"
                + name + "</td></tr>");

                out.println("<tr><td class='label'>Subject</td><td>"
                + subject + "</td></tr>");

                out.println("<tr><td class='label'>Old Marks</td><td>"
                + oldMarks + "</td></tr>");

                out.println("<tr><td class='label'>New Marks</td><td class='newMarks'>"
                + newMarks + "</td></tr>");

                out.println("</table>");
            }
            else
            {
                out.println("<h2>Record Not Found</h2>");
            }

            out.println("<a href='update.jsp'>Update Another Record</a>");

            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}