<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Display Student Marks</title>

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
background:linear-gradient(135deg,#141e30,#243b55);
}

.container{
width:450px;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.25);
text-align:center;
}

h2{
color:#2ebf91;
margin-bottom:25px;
font-size:30px;
}

label{
display:block;
text-align:left;
font-weight:bold;
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
border-color:#2ebf91;
box-shadow:0 0 8px rgba(46,191,145,0.35);
}

.btn{
width:100%;
padding:14px;
margin-top:18px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#2ebf91,#1abc9c);
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
background:linear-gradient(to right,#36d1dc,#5b86e5);
transition:0.3s;
}

.link-btn:hover{
transform:scale(1.03);
box-shadow:0 8px 18px rgba(0,0,0,0.2);
}

a.home{
display:block;
margin-top:18px;
text-decoration:none;
font-weight:bold;
color:#2ebf91;
font-size:16px;
}

a.home:hover{
color:#1abc9c;
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
let id=document.forms["f"]["id"].value;

if(id!="")
{
if(isNaN(id))
{
alert("Student ID must be numeric");
return false;
}
}

return true;
}

</script>

</head>

<body>

<div class="container">

<h2>Display Student Marks</h2>

<form name="f" action="DisplayMarksServlet" method="get"
onsubmit="return validateForm()">

<label>Enter Student ID</label>

<input type="text" name="id" class="input-box"
placeholder="Search by Student ID">

<input type="submit" value="Search Record" class="btn">

</form>

<a href="DisplayMarksServlet" class="link-btn">
Show All Records
</a>

<div class="note">
Leave empty to view all student records
</div>

<a href="index.jsp" class="home">Back to Home</a>

</div>

</body>
</html>
