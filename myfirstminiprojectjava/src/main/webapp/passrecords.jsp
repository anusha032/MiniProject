<%@ page import="java.sql.*" %>
<%@ page import="com.dao.MarkDAO" %>

<html>
<head>
<title>Pass Records</title>

<style>

body{
font-family:Arial;
background:linear-gradient(135deg,#d4fc79,#96e6a1);
padding:40px;
}

h2{
text-align:center;
color:green;
margin-bottom:25px;
}

table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

th{
background:green;
color:white;
padding:12px;
}

td{
padding:10px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f1fff1;
}

a{
display:block;
width:200px;
margin:25px auto;
padding:12px;
background:green;
color:white;
text-align:center;
text-decoration:none;
border-radius:10px;
}

</style>

</head>

<body>

<h2>Passed Students Records</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Date</th>
<th>Status</th>
</tr>

<%

try{

Connection con = MarkDAO.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM StudentMarks WHERE Marks >= 35");

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>

<td><%= rs.getInt("StudentID") %></td>

<td><%= rs.getString("StudentName") %></td>

<td><%= rs.getString("Subject") %></td>

<td><%= rs.getInt("Marks") %></td>

<td><%= rs.getDate("ExamDate") %></td>

<td style="color:green;font-weight:bold;">
PASS
</td>

</tr>

<%
}

con.close();

}catch(Exception e){
out.println(e);
}

%>

</table>

<a href="index.jsp">← Back to Home</a>

</body>
</html>