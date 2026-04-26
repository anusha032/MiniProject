<%@ page import="java.sql.*" %>
<%@ page import="com.dao.MarkDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>View Student Marks</title>

<style>

body{
font-family:Arial;
background:linear-gradient(to right,#141e30,#243b55);
margin:0;
padding:0;
color:white;
}

.container{
width:90%;
margin:auto;
margin-top:40px;
}

h2{
text-align:center;
margin-bottom:20px;
}

table{
width:100%;
border-collapse:collapse;
background:white;
color:black;
border-radius:10px;
overflow:hidden;
}

th, td{
padding:12px;
text-align:center;
border-bottom:1px solid #ddd;
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

.btn{
padding:5px 10px;
border-radius:5px;
background:#007bff;
color:white;
text-decoration:none;
}

.btn:hover{
background:#0056b3;
}

</style>

</head>

<body>

<div class="container">

<h2>Student Marks List</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Date</th>
</tr>

<%
try {
    Connection con = MarkDAO.getConnection();
    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("SELECT * FROM StudentMarks");

    while(rs.next()) {
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

    con.close();

} catch(Exception e) {
    out.println("<h3 style='color:red;text-align:center;'>Error: " + e + "</h3>");
}
%>

</table>

<br>

<div style="text-align:center;margin-top:20px;">
<a href="index.jsp">Back to Home</a>
</div>

</div>

</body>
</html>
