<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Student Reports</title>

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
width:420px;
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
margin-top:10px;
font-weight:bold;
color:#333;
}

select, input[type=text]{
width:100%;
padding:12px;
margin-top:5px;
border:1px solid #ccc;
border-radius:10px;
outline:none;
transition:0.3s;
}

select:focus, input[type=text]:focus{
border-color:#36d1dc;
box-shadow:0 0 5px rgba(54,209,220,0.4);
}

input[type=submit]{
width:100%;
margin-top:20px;
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

<h2>Student Marks Reports</h2>

<form action="ReportServlet" method="get">

<label>Select Report Type</label>
<select name="type">
    <option value="above">Marks Above Value</option>
    <option value="subject">Subject Wise</option>
    <option value="top">Top N Students</option>
</select>

<label>Enter Value / Subject / Top N</label>
<input type="text" name="value" placeholder="Enter value">

<input type="submit" value="Generate Report">

</form>

<a href="report_form.jsp">Advanced Report Search</a>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
