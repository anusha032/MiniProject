<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.dao.MarkDAO" %>

<html>
<head>
<meta charset="UTF-8">
<title>Report Result</title>

<style>

body{
margin:0;
font-family:Arial;
background:linear-gradient(to right,#141e30,#243b55);
color:white;
}

.container{
width:90%;
margin:auto;
margin-top:40px;
text-align:center;
}

h2{
color:#2ebf91;
}

table{
width:90%;
margin:auto;
border-collapse:collapse;
background:white;
color:black;
border-radius:10px;
overflow:hidden;
}

th,td{
padding:12px;
text-align:center;
border:1px solid #ddd;
}

th{
background:#2ebf91;
color:white;
}

tr:hover{
background:#f1f1f1;
}

a{
color:#2ebf91;
text-decoration:none;
font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<h2>Report Result</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Exam Date</th>
</tr>

<%
try {

    Connection con = MarkDAO.getConnection();

    String subject = request.getParameter("subject");
    String marks = request.getParameter("marks");

    StringBuilder sql = new StringBuilder("SELECT * FROM StudentMarks WHERE 1=1");

    if(subject != null && !subject.trim().isEmpty()) {
        sql.append(" AND Subject = '").append(subject).append("'");
    }

    if(marks != null && !marks.trim().isEmpty()) {
        sql.append(" AND Marks >= ").append(marks);
    }

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql.toString());

    boolean found = false;

    while(rs.next()) {
        found = true;
%>

<tr>
<td><%= rs.getInt("StudentID") %></td>
<td><%= rs.getString("StudentName") %></td>
<td><%= rs.getString("Subject") %></td>
<td><%= rs.getInt("Marks") %></td>
<td><%= rs.getDate("ExamDate") %></td>
</tr>

<%
    }

    if(!found) {
%>
<tr>
<td colspan="5" style="color:red;">No Records Found</td>
</tr>
<%
    }

    con.close();

} catch(Exception e) {
    out.println("<h3 style='color:red;text-align:center;'>" + e + "</h3>");
}
%>

</table>

<br><br>

<div style="text-align:center;">
<a href="report_form.jsp">Back</a>
</div>

</div>

</body>
</html>
