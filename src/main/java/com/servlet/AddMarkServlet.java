package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.MarkDAO;

@WebServlet("/AddMarkServlet")
public class AddMarkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String name = request.getParameter("name");
            String subject = request.getParameter("subject");
            String marksStr = request.getParameter("marks");
            String date = request.getParameter("date");

            if(name.equals("") || subject.equals("") ||
               marksStr.equals("") || date.equals("")) {

                out.println("<h2>All fields are required</h2>");
                return;
            }

            int marks = Integer.parseInt(marksStr);

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps = con.prepareStatement(
            "insert into StudentMarks(StudentName,Subject,Marks,ExamDate) values(?,?,?,?)");

            ps.setString(1, name);
            ps.setString(2, subject);
            ps.setInt(3, marks);
            ps.setString(4, date);

            int x = ps.executeUpdate();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Add Result</title>");

            out.println("<style>");
            out.println("body{margin:0;font-family:Arial;background:linear-gradient(135deg,#ff9a9e,#fad0c4,#fbc2eb);height:100vh;display:flex;justify-content:center;align-items:center;}");
            out.println(".box{background:white;width:430px;padding:35px;border-radius:22px;box-shadow:0 15px 35px rgba(0,0,0,0.25);text-align:center;}");
            out.println("h2{margin-bottom:20px;}");
            out.println("a{display:block;text-decoration:none;margin-top:15px;font-weight:bold;color:#ff416c;}");
            out.println("a:hover{color:#ff4b2b;}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");

            if(x > 0)
                out.println("<h2 style='color:green;'>Record Added Successfully</h2>");
            else
                out.println("<h2 style='color:red;'>Record Not Added</h2>");

            out.println("<a href='markadd.jsp'>Add Another Record</a>");
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
