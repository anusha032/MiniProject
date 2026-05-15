<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Report Criteria</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:Arial, sans-serif;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#1f1c2c,#928dab);
}

.container{
width:430px;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.25);
text-align:center;
}

h2{
color:#6a11cb;
margin-bottom:25px;
font-size:30px;
}

label{
display:block;
text-align:left;
font-weight:bold;
margin-top:12px;
margin-bottom:8px;
color:#333;
font-size:16px;
}

.input-box{
width:100%;
padding:13px;
border:2px solid #ddd;
border-radius:12px;
font-size:16px;
outline:none;
transition:0.3s;
}

.input-box:focus{
border-color:#6a11cb;
box-shadow:0 0 8px rgba(106,17,203,0.35);
}

.btn{
width:100%;
margin-top:22px;
padding:14px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#6a11cb,#2575fc);
color:white;
font-size:18px;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

.btn:hover{
transform:scale(1.03);
box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

.note{
margin-top:14px;
font-size:13px;
color:gray;
}

a{
display:block;
margin-top:18px;
text-decoration:none;
font-weight:bold;
color:#6a11cb;
font-size:16px;
}

a:hover{
color:#2575fc;
}

</style>

<script>

function validateForm()
{
let subject=document.forms["f"]["subject"].value;
let marks=document.forms["f"]["marks"].value;

if(subject=="" && marks=="")
{
alert("Enter Subject or Minimum Marks");
return false;
}

if(marks!="")
{
if(isNaN(marks))
{
alert("Minimum Marks must be numeric");
return false;
}

if(marks<0 || marks>100)
{
alert("Marks must be between 0 and 100");
return false;
}
}

return true;
}

</script>

</head>

<body>

<div class="container">

<h2>Generate Custom Report</h2>

<form name="f" action="ReportCriteriaServlet" method="post"
onsubmit="return validateForm()">

<label>Enter Subject</label>
<input type="text" name="subject" class="input-box"
placeholder="e.g. Java">

<label>Minimum Marks</label>
<input type="text" name="marks" class="input-box"
placeholder="e.g. 50">

<input type="submit" value="Generate Report" class="btn">

</form>

<div class="note">
Enter subject, minimum marks, or both
</div>

<a href="reports.jsp">Back to Reports</a>

</div>

</body>
</html>
