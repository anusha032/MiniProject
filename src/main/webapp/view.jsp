<%@ page import="java.sql.*" %>
<%@ page import="com.dao.MarkDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>View Student Marks</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:Arial, sans-serif;
background:linear-gradient(135deg,#141e30,#243b55);
min-height:100vh;
padding:40px;
}

.container{
width:95%;
max-width:1100px;
margin:auto;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.25);
text-align:center;
}

h2{
color:#2ebf91;
margin-bottom:25px;
font-size:32px;
}

table{
width:100%;
border-collapse:collapse;
overflow:hidden;
border-radius:15px;
}

th{
background:#2ebf91;
color:white;
padding:14px;
font-size:17px;
}

td{
padding:13px;
border-bottom:1px solid #ddd;
font-size:16px;
color:#333;
}

tr:hover{
background:#f5f5f5;
}

.btn{
display:inline-block;
margin-top:22px;
padding:12px 22px;
background:linear-gradient(to right,#2ebf91,#1abc9c);
color:white;
text-decoration:none;
font-weight:bold;
border-radius:12px;
transition:0.3s;
}

.btn:hover{
transform:scale(1.03);
box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

.msg{
color:red;
font-weight:bold;
padding:15px;
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
<th>Exam Date</th>
</tr>

<%
try
{
    Connection con = MarkDAO.getConnection();
    Statement st = con.createStatement();

    ResultSet rs =
    st.executeQuery("select * from StudentMarks");

    boolean found = false;

    while(rs.next())
    {
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

    if(!found)
    {
%>

<tr>
<td colspan="5" class="msg">No Records Found</td>
</tr>

<%
    }

    con.close();
}
catch(Exception e)
{
%>

<tr>
<td colspan="5" class="msg">Error : <%= e %></td>
</tr>

<%
}
%>

</table>

<a href="index.jsp" class="btn">Back to Home</a>

</div>

</body>
</html>
