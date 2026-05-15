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
background:linear-gradient(135deg,#11998e,#38ef7d);
}

.container{
width:500px;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.25);
text-align:center;
}

h2{
color:#11998e;
margin-bottom:25px;
font-size:30px;
}

label{
display:block;
text-align:left;
margin-bottom:8px;
font-weight:bold;
color:#444;
}

.input-box{
width:100%;
padding:12px;
border:2px solid #ddd;
border-radius:10px;
font-size:16px;
transition:0.3s;
}

.input-box:focus{
border-color:#11998e;
outline:none;
box-shadow:0 0 8px rgba(17,153,142,0.3);
}

.btn{
width:100%;
padding:14px;
margin-top:18px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#11998e,#38ef7d);
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
margin-top:15px;
padding:14px;
border-radius:12px;
text-decoration:none;
font-weight:bold;
color:white;
background:linear-gradient(to right,#00b09b,#96c93d);
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
color:#11998e;
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

<label>Search by Student ID</label>

<input type="text" name="id" class="input-box"
placeholder="Enter Student ID">

<input type="submit" value="Search Record" class="btn">

</form>

<a href="DisplayMarksServlet" class="link-btn">
Show All Records
</a>

<div class="note">
Leave empty and click Show All Records
</div>

<a href="index.jsp" class="home">Back to Home</a>

</div>

</body>
</html>
