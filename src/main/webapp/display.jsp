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
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
width:450px;
background:white;
padding:30px;
border-radius:18px;
box-shadow:0 10px 25px rgba(0,0,0,0.4);
text-align:center;
}

h2{
color:#2c5364;
margin-bottom:20px;
}

label{
display:block;
text-align:left;
font-weight:bold;
margin-top:10px;
color:#333;
}

input[type=text]{
width:100%;
padding:12px;
margin-top:5px;
border:1px solid #ccc;
border-radius:10px;
outline:none;
transition:0.3s;
}

input[type=text]:focus{
border-color:#2c5364;
box-shadow:0 0 6px rgba(44,83,100,0.4);
}

input[type=submit]{
width:100%;
margin-top:15px;
padding:12px;
border:none;
border-radius:10px;
background:linear-gradient(to right,#36d1dc,#5b86e5);
color:white;
font-size:16px;
cursor:pointer;
transition:0.3s;
}

input[type=submit]:hover{
transform:scale(1.03);
}

a{
display:block;
margin-top:15px;
text-decoration:none;
color:#36d1dc;
font-weight:bold;
}

a:hover{
color:#5b86e5;
}

</style>

</head>

<body>

<div class="container">

<h2>Display Student Marks</h2>

<form action="DisplayMarksServlet" method="get">

<label>Enter Student ID</label>
<input type="text" name="id" placeholder="Search by ID">

<input type="submit" value="Search">

</form>

<a href="DisplayMarksServlet">Show All Records</a>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
