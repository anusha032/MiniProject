<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.dao.MarkDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student Records</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:linear-gradient(135deg,#ffe6f0,#fff5f8);
padding:30px;
}

/* HEADING */

.title{
text-align:center;
font-size:42px;
font-weight:bold;
color:#d63384;
margin-bottom:35px;
}

/* SUMMARY BOXES */

.summary{
display:flex;
justify-content:center;
gap:25px;
flex-wrap:wrap;
margin-bottom:40px;
}

.box{
width:230px;
padding:28px;
border-radius:20px;
text-align:center;
color:white;
font-size:22px;
font-weight:bold;
box-shadow:0 10px 20px rgba(0,0,0,0.15);
transition:0.3s;
}

.box:hover{
transform:translateY(-5px);
}

.total{
background:linear-gradient(135deg,#667eea,#764ba2);
}

.pass{
background:linear-gradient(135deg,#00b09b,#96c93d);
}

.fail{
background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

/* TABLE */

table{
width:100%;
border-collapse:collapse;
background:white;
border-radius:18px;
overflow:hidden;
box-shadow:0 10px 25px rgba(0,0,0,0.12);
}

th{
background:#ff69b4;
color:white;
padding:16px;
font-size:18px;
}

td{
padding:14px;
text-align:center;
border-bottom:1px solid #f1f1f1;
}

tr:hover{
background:#fff0f6;
}

/* STATUS */

.passText{
color:green;
font-weight:bold;
font-size:16px;
}

.failText{
color:red;
font-weight:bold;
font-size:16px;
}

/* BUTTON */

.back-btn{
display:block;
width:220px;
margin:35px auto;
padding:14px;
text-align:center;
background:#ff69b4;
color:white;
text-decoration:none;
font-weight:bold;
border-radius:12px;
transition:0.3s;
}

.back-btn:hover{
background:#e754a3;
transform:scale(1.03);
}

</style>

</head>

<body>

<div class="title">
📋 Student Records
</div>

<div class="summary">

<!-- TOTAL STUDENTS -->

<div class="box total">

Total Students<br><br>

<%

try{

Connection con = MarkDAO.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT COUNT(*) FROM StudentMarks");

ResultSet rs = ps.executeQuery();

if(rs.next()){
out.println(rs.getInt(1));
}

}catch(Exception e){
out.println(e);
}

%>

</div>

<!-- PASSED STUDENTS -->

<div class="box pass">

Passed Students<br><br>

<%

try{

Connection con = MarkDAO.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT COUNT(*) FROM StudentMarks WHERE Marks >= 35");

ResultSet rs = ps.executeQuery();

if(rs.next()){
out.println(rs.getInt(1));
}

}catch(Exception e){
out.println(e);
}

%>

</div>

<!-- FAILED STUDENTS -->

<div class="box fail">

Failed Students<br><br>

<%

try{

Connection con = MarkDAO.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT COUNT(*) FROM StudentMarks WHERE Marks < 35");

ResultSet rs = ps.executeQuery();

if(rs.next()){
out.println(rs.getInt(1));
}

}catch(Exception e){
out.println(e);
}

%>

</div>

</div>

<!-- TABLE -->

<table>

<tr>
<th>Student ID</th>
<th>Student Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Exam Date</th>
<th>Status</th>
</tr>

<%

try{

Connection con = MarkDAO.getConnection();

PreparedStatement ps =
con.prepareStatement(
"SELECT * FROM StudentMarks");

ResultSet rs = ps.executeQuery();

while(rs.next()){

int marks = rs.getInt("Marks");

%>

<tr>

<td><%= rs.getInt("StudentID") %></td>

<td><%= rs.getString("StudentName") %></td>

<td><%= rs.getString("Subject") %></td>

<td><%= marks %></td>

<td><%= rs.getDate("ExamDate") %></td>

<td>

<%

if(marks >= 35){
%>

<span class="passText">PASS</span>

<%
}else{
%>

<span class="failText">FAIL</span>

<%
}
%>

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

<a href="index.jsp" class="back-btn">
← Back to Home
</a>

</body>
</html>