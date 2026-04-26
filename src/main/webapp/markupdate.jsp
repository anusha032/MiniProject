<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Update Student Marks</title>

<style>

body{
margin:0;
font-family:Arial, sans-serif;
background: linear-gradient(135deg, #1f4037, #99f2c8);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
width:380px;
background:white;
padding:30px;
border-radius:18px;
box-shadow:0 10px 25px rgba(0,0,0,0.2);
text-align:center;
}

h2{
margin-bottom:20px;
color:#1f4037;
}

label{
display:block;
text-align:left;
margin-top:10px;
font-weight:bold;
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
border-color:#1f4037;
box-shadow:0 0 5px rgba(31,64,55,0.4);
}

input[type=submit]{
width:100%;
margin-top:20px;
padding:12px;
border:none;
border-radius:10px;
background:linear-gradient(to right,#1f4037,#99f2c8);
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
color:#1f4037;
font-weight:bold;
}

a:hover{
color:#0f2e27;
}

</style>

</head>

<body>

<div class="container">

<!-- SAFE TEXT (NO EMOJI → NO âœï¸ ERROR) -->
<h2>Update Student Marks</h2>

<form action="UpdateMarkServlet" method="post">

<label>Student ID</label>
<input type="text" name="id" placeholder="Enter Student ID" required>

<label>New Marks</label>
<input type="text" name="marks" placeholder="Enter Marks (0-100)" required>

<input type="submit" value="Update Marks">

</form>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
