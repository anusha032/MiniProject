<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Report Criteria</title>

<style>

body{
margin:0;
font-family:Arial;
background:linear-gradient(135deg,#1f1c2c,#928dab);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
width:400px;
background:white;
padding:30px;
border-radius:18px;
box-shadow:0 10px 25px rgba(0,0,0,0.3);
text-align:center;
}

h2{
color:#6a11cb;
margin-bottom:20px;
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
border-color:#6a11cb;
box-shadow:0 0 5px rgba(106,17,203,0.4);
}

input[type=submit]{
width:100%;
margin-top:20px;
padding:12px;
border:none;
border-radius:10px;
background:linear-gradient(to right,#6a11cb,#2575fc);
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
color:#6a11cb;
font-weight:bold;
}

a:hover{
color:#2575fc;
}

</style>

</head>

<body>

<div class="container">

<h2>Generate Custom Report</h2>

<form action="ReportCriteriaServlet" method="post">

<label>Enter Subject</label>
<input type="text" name="subject" placeholder="e.g. Java">

<label>Minimum Marks</label>
<input type="text" name="marks" placeholder="e.g. 50">

<input type="submit" value="Generate Report">

</form>

<a href="reports.jsp">Back to Reports</a>

</div>

</body>
</html>
