<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<title>Add Student Marks</title>

<style>

body{
font-family:Arial;
background:linear-gradient(to right,#36d1dc,#5b86e5);
}

.container{
width:450px;
margin:auto;
margin-top:60px;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0px 0px 10px gray;
}

h2{
text-align:center;
color:#333;
}

input[type=text],
input[type=date]{
width:100%;
padding:10px;
margin:8px 0;
border:1px solid #ccc;
border-radius:8px;
}

input[type=submit]{
width:100%;
padding:12px;
background:#28a745;
color:white;
border:none;
border-radius:8px;
font-size:18px;
cursor:pointer;
}

input[type=submit]:hover{
background:#218838;
}

a{
display:block;
text-align:center;
margin-top:15px;
text-decoration:none;
color:#007bff;
}

</style>

<script>

function validateForm()
{
let id = document.forms["f"]["id"].value.trim();
let name = document.forms["f"]["name"].value.trim();
let subject = document.forms["f"]["subject"].value.trim();
let marks = document.forms["f"]["marks"].value.trim();
let date = document.forms["f"]["date"].value.trim();

if(id === "" || name === "" || subject === "" || marks === "" || date === "")
{
alert("All fields are required");
return false;
}

if(isNaN(id))
{
alert("ID must be numeric");
return false;
}

if(isNaN(marks) || marks < 0 || marks > 100)
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

Student ID:
<input type="text" name="id" required>

Student Name:
<input type="text" name="name" required>

Subject:
<input type="text" name="subject" required>

Marks:
<input type="text" name="marks" required>

Exam Date:
<input type="date" name="date" required>

<input type="submit" value="Add Record">

</form>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
