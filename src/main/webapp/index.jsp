<!-- index.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<title>Mark Management System</title>

<style>

body{
font-family: Arial;
background: linear-gradient(to right,#4facfe,#00f2fe);
text-align:center;
margin-top:50px;
}

.container{
background:white;
width:500px;
margin:auto;
padding:30px;
border-radius:15px;
box-shadow:0px 0px 10px gray;
}

h1{
color:#333;
}

a{
display:block;
margin:10px;
padding:10px;
background:#007bff;
color:white;
text-decoration:none;
border-radius:8px;
font-size:18px;
}

a:hover{
background:#0056b3;
}

</style>

</head>

<body>

<div class="container">

<h1>Mark Management System</h1>

<a href="markadd.jsp">Add Marks</a>

<a href="markupdate.jsp">Update Marks</a>

<a href="markdelete.jsp">Delete Marks</a>

<a href="markdisplay.jsp">Display Marks</a>

<a href="reports.jsp">Reports</a>

</div>

</body>
</html>

