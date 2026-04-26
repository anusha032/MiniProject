<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Display Student Marks</title>

<style>

body{
margin:0;
font-family:Arial;
background:linear-gradient(to right,#141e30,#243b55);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
color:white;
}

.container{
width:400px;
background:white;
color:black;
padding:30px;
border-radius:15px;
box-shadow:0 10px 25px rgba(0,0,0,0.3);
text-align:center;
}

h2{
color:#2ebf91;
}

input[type=text]{
width:100%;
padding:12px;
margin:10px 0;
border:1px solid #ccc;
border-radius:8px;
}

input[type=submit]{
width:100%;
padding:12px;
background:#2ebf91;
color:white;
border:none;
border-radius:8px;
cursor:pointer;
font-size:16px;
}

input[type=submit]:hover{
background:#239b7e;
}

a{
display:block;
margin-top:15px;
text-decoration:none;
color:#2ebf91;
font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<h2>Display Student Marks</h2>

<!-- SEARCH BY ID -->
<form action="DisplayMarksServlet" method="get">

<label>Enter Student ID</label>
<input type="text" name="id" placeholder="Search by ID">

<input type="submit" value="Search">

</form>

<!-- SHOW ALL -->
<br>
<a href="DisplayMarksServlet">Show All Records</a>

<br>
<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
