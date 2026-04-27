<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Update Student Marks</title>

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
background:linear-gradient(135deg,#1f4037,#99f2c8);
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
color:#1f4037;
margin-bottom:25px;
font-size:30px;
}

label{
display:block;
text-align:left;
font-weight:bold;
margin-bottom:8px;
margin-top:12px;
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
border-color:#1f4037;
box-shadow:0 0 8px rgba(31,64,55,0.35);
}

.btn{
width:100%;
margin-top:22px;
padding:14px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#1f4037,#99f2c8);
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
color:#1f4037;
font-size:16px;
}

a:hover{
color:#0f2e27;
}

</style>

<script>

function validateForm()
{
let id=document.forms["f"]["id"].value;
let marks=document.forms["f"]["marks"].value;

if(id=="" || marks=="")
{
alert("All fields are required");
return false;
}

if(isNaN(id))
{
alert("Student ID must be numeric");
return false;
}

if(isNaN(marks))
{
alert("Marks must be numeric");
return false;
}

if(marks<0 || marks>100)
{
alert("Marks must be between 0 and 100");
return false;
}

return true;
}

</script>

</head>

<body>

<div class="container">

<h2>Update Student Marks</h2>

<form name="f" action="UpdateMarkServlet" method="post"
onsubmit="return validateForm()">

<label>Student ID</label>
<input type="text" name="id" class="input-box"
placeholder="Enter Student ID">

<label>New Marks</label>
<input type="text" name="marks" class="input-box"
placeholder="Enter Marks (0-100)">

<input type="submit" value="Update Marks" class="btn">

</form>

<div class="note">
Enter valid Student ID and new marks
</div>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
