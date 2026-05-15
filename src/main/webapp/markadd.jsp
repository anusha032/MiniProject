<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Add Student Marks</title>

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
background:linear-gradient(135deg,#43cea2,#185a9d);
}

.container{
width:460px;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.25);
}

h2{
text-align:center;
color:#185a9d;
margin-bottom:25px;
font-size:30px;
}

label{
display:block;
margin-top:14px;
margin-bottom:6px;
font-weight:bold;
color:#444;
}

.input-box{
width:100%;
padding:12px;
border:2px solid #ddd;
border-radius:10px;
font-size:15px;
transition:0.3s;
}

.input-box:focus{
border-color:#185a9d;
outline:none;
box-shadow:0 0 8px rgba(24,90,157,0.3);
}

/* Readonly field */
input[readonly]{
background:#f3f3f3;
color:#777;
cursor:not-allowed;
}

/* Note text */
.note{
display:block;
text-align:center;
font-size:13px;
color:gray;
margin-top:6px;
font-style:italic;
}

.btn{
width:100%;
padding:14px;
margin-top:25px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#43cea2,#185a9d);
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

a{
display:block;
text-align:center;
margin-top:18px;
text-decoration:none;
font-weight:bold;
color:#185a9d;
}

</style>

<script>

function validateForm()
{
let name=document.forms["f"]["name"].value;
let subject=document.forms["f"]["subject"].value;
let marks=document.forms["f"]["marks"].value;
let date=document.forms["f"]["date"].value;

if(name=="" || subject=="" || marks=="" || date=="")
{
alert("All fields are required");
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

<h2>Add Student Marks</h2>

<form name="f" action="AddMarkServlet" method="post"
onsubmit="return validateForm()">

<!-- Student ID -->
<label>Student ID</label>
<input type="text" name="id" class="input-box" 
value="Auto Generated" readonly>

<label class="note">* Student ID will be generated automatically</label>

<label>Student Name</label>
<input type="text" name="name" class="input-box"
placeholder="Enter student name">

<label>Subject</label>
<select name="subject" class="input-box">
<option value="">Select Subject</option>
<option value="DBMS">DBMS</option>
<option value="Advanced Java">Advanced Java</option>
<option value="Microcontroller">Microcontroller</option>
<option value="Python">Python</option>
<option value="Biology">Biology</option>
<option value="ADA">ADA</option>
<option value="ESD">ESD</option>
<option value="UHV">UHV</option>
</select>

<label>Marks</label>
<input type="text" name="marks" class="input-box"
placeholder="Enter marks">

<label>Exam Date</label>
<input type="date" name="date" class="input-box">

<input type="submit" value="Add Record" class="btn">

</form>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>