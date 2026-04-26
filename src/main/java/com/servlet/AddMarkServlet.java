package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MarkDAO;

@WebServlet("/AddMarkServlet")
public class AddMarkServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            // ✔ Student ID from form
            int studentId = Integer.parseInt(request.getParameter("id"));

            String studentName = request.getParameter("name");
            String subject = request.getParameter("subject");
            int marks = Integer.parseInt(request.getParameter("marks"));
            String examDate = request.getParameter("date");

            // Validation
            if (studentName == null || studentName.trim().isEmpty() ||
                subject == null || subject.trim().isEmpty() ||
                examDate == null || examDate.trim().isEmpty()) {

                out.println("<h2 style='color:red;'>All fields are required</h2>");
                return;
            }

            Connection con = MarkDAO.getConnection();

            // ✔ 5 placeholders = 5 values
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO StudentMarks(StudentID, StudentName, Subject, Marks, ExamDate) VALUES(?,?,?,?,?)"
            );

            ps.setInt(1, studentId);
            ps.setString(2, studentName);
            ps.setString(3, subject);
            ps.setInt(4, marks);
            ps.setString(5, examDate);

            int result = ps.executeUpdate();

            out.println("<html><body style='text-align:center;font-family:Arial;margin-top:60px;'>");

            if (result > 0) {
                out.println("<h2 style='color:green;'>Record Added Successfully</h2>");
            } else {
                out.println("<h2 style='color:red;'>Record Not Added</h2>");
            }

            out.println("<br><a href='markadd.jsp'>Add Again</a>");
            out.println("<br><a href='index.jsp'>Home</a>");
            out.println("</body></html>");

            con.close();

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>" + e + "</h3>");
        }
    }
}
