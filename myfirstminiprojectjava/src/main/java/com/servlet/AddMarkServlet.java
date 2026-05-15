package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

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

            if(name == null || subject == null || marksStr == null || date == null ||
               name.trim().equals("") || subject.trim().equals("") ||
               marksStr.trim().equals("") || date.trim().equals("")) {

                out.println("<h2 style='color:red;text-align:center;'>All fields are required</h2>");
                return;
            }

            int marks = Integer.parseInt(marksStr);

            Connection con = MarkDAO.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "insert into StudentMarks(StudentName,Subject,Marks,ExamDate) values(?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS
            );

            ps.setString(1, name);
            ps.setString(2, subject);
            ps.setInt(3, marks);
            ps.setString(4, date);

            int x = ps.executeUpdate();

            int generatedId = 0;
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()){
                generatedId = rs.getInt(1);
            }

            // 🎨 WHITE + BLUE UI
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Result</title>");

            out.println("<style>");
            out.println("body{margin:0;font-family:Arial;background:#eef3f8;height:100vh;display:flex;justify-content:center;align-items:center;}");
            out.println(".card{background:#ffffff;padding:40px;width:420px;border-radius:18px;box-shadow:0 10px 25px rgba(0,0,0,0.15);text-align:center;}");
            out.println(".success{font-size:24px;font-weight:bold;color:#0d6efd;margin-bottom:15px;}");
            out.println(".fail{font-size:24px;font-weight:bold;color:#dc3545;margin-bottom:15px;}");
            out.println(".id{font-size:18px;color:#333;margin-bottom:20px;}");
            out.println(".btn{display:block;margin:10px auto;padding:12px 20px;border:none;border-radius:10px;background:#0d6efd;color:white;font-weight:bold;text-decoration:none;transition:0.3s;}");
            out.println(".btn:hover{background:#084298;transform:scale(1.05);}");
            out.println("</style>");

            out.println("</head>");
            out.println("<body>");

            out.println("<div class='card'>");

            if(x > 0) {
                out.println("<div class='success'>✔ Record Added Successfully</div>");
                out.println("<div class='id'>Student ID: " + generatedId + "</div>");
            } else {
                out.println("<div class='fail'>✖ Record Not Added</div>");
            }

            out.println("<a href='markadd.jsp' class='btn'>Add More</a>");
            out.println("<a href='index.jsp' class='btn'>Home</a>");

            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

            con.close();

        } catch(Exception e) {
            out.println("<h3 style='color:red;text-align:center;'>" + e + "</h3>");
        }
    }
}