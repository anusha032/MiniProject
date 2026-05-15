<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>Update Student Marks</title>

<style>

body{
font-family:Arial;
background:linear-gradient(135deg,#ffd6e7,#fff0f5);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
margin:0;
}

.container{
background:white;
padding:35px;
border-radius:20px;
width:500px;
box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

h2{
text-align:center;
color:#ff5c93;
margin-bottom:20px;
}

label{
font-weight:bold;
margin-top:10px;
display:block;
color:#d63384;
}

.input-box{
width:100%;
padding:12px;
margin-top:5px;
border-radius:8px;
border:1px solid #ffb6c1;
background:#f4f6fb;
}

input[readonly]{
background:#eee;
}

.btn{
width:100%;
margin-top:18px;
padding:12px;
background:#ff5c93;
color:white;
border:none;
border-radius:10px;
cursor:pointer;
font-size:16px;
font-weight:bold;
}

.btn:hover{
background:#e64980;
}

.back{
display:block;
text-align:center;
margin-top:15px;
padding:10px;
text-decoration:none;
background:#fff0f5;
border-radius:8px;
color:#d63384;
border:1px solid #ffb6c1;
}

</style>
</head>

<body>

<div class="container">

<h2>Update Student Marks</h2>

<!-- FETCH DETAILS -->

<form action="FetchMarkServlet" method="post">

<label>Enter Student ID</label>

<input type="number"
name="id"
class="input-box"
required>

<input type="submit"
value="Fetch Details"
class="btn">

</form>

<br>

<!-- UPDATE FORM -->

<form action="UpdateMarkServlet" method="post">

<label>Student ID</label>

<input type="text"
name="id"
class="input-box"
value="<%= request.getAttribute("id") != null ? request.getAttribute("id") : "" %>"
readonly>

<label>Student Name</label>

<input type="text"
class="input-box"
value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>"
readonly>

<label>Subject</label>

<input type="text"
class="input-box"
value="<%= request.getAttribute("subject") != null ? request.getAttribute("subject") : "" %>"
readonly>

<label>Previous Marks</label>

<input type="text"
class="input-box"
value="<%= request.getAttribute("oldMarks") != null ? request.getAttribute("oldMarks") : "" %>"
readonly>

<label>Exam Date</label>

<input type="text"
class="input-box"
value="<%= request.getAttribute("date") != null ? request.getAttribute("date") : "" %>"
readonly>

<label>New Marks</label>

<input type="number"
name="marks"
class="input-box"
required>

<input type="submit"
value="Update Marks"
class="btn">

</form>

<a href="index.jsp" class="back">
← Back to Home
</a>

</div>

</body>
</html>