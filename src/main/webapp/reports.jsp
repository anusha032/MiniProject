<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Student Reports</title>

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
background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
}

.container{
width:450px;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.30);
text-align:center;
}

h2{
color:#2c5364;
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

.input-box,
select{
width:100%;
padding:13px;
border:2px solid #ddd;
border-radius:12px;
font-size:16px;
outline:none;
transition:0.3s;
}

.input-box:focus,
select:focus{
border-color:#36d1dc;
box-shadow:0 0 8px rgba(54,209,220,0.35);
}

.btn{
width:100%;
margin-top:22px;
padding:14px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#36d1dc,#5b86e5);
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

.link-btn{
display:block;
margin-top:16px;
padding:14px;
border-radius:12px;
text-decoration:none;
font-weight:bold;
font-size:16px;
color:white;
background:linear-gradient(to right,#8e44ad,#36d1dc);
transition:0.3s;
}

.link-btn:hover{
transform:scale(1.03);
box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

.home{
display:block;
margin-top:18px;
text-decoration:none;
font-weight:bold;
color:#2c5364;
font-size:16px;
}

.home:hover{
color:#36d1dc;
}

.note{
margin-top:12px;
font-size:13px;
color:gray;
}

</style>

<script>

function validateForm()
{
let type=document.forms["f"]["type"].value;
let value=document.forms["f"]["value"].value;

if(value=="")
{
alert("Please enter required value");
return false;
}

if(type=="above" || type=="top")
{
if(isNaN(value))
{
alert("Please enter numeric value");
return false;
}
}

return true;
}

</script>

</head>

<body>

<div class="container">

<h2>Student Marks Reports</h2>

<form name="f" action="ReportServlet" method="get"
onsubmit="return validateForm()">

<label>Select Report Type</label>

<select name="type">
<option value="above">Marks Above Value</option>
<option value="below">Marks Below Value</option>
<option value="subject">Subject Wise</option>
<option value="top">Top N Students</option>
</select>

<label>Enter Value / Subject / Top N</label>

<input type="text" name="value" class="input-box"
placeholder="50 / Java / 5">

<input type="submit" value="Generate Report" class="btn">

</form>

<a href="report_form.jsp" class="link-btn">
Advanced Report Search
</a>

<div class="note">
Example: 50 for Above, Java for Subject, 5 for Top Students
</div>

<a href="index.jsp" class="home">Back to Home</a>

</div>

</body>
</html>
