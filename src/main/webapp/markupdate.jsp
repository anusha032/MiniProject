<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Marks</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:#f8d7e4;
}

/* MAIN BOX */
.container{
width:550px;
background:white;
padding:40px;
border-radius:20px;
box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

/* TITLE */
h2{
text-align:center;
color:#ff5c93;
font-size:40px;
margin-bottom:25px;
}

/* LABEL */
label{
display:block;
margin-top:12px;
margin-bottom:5px;
font-weight:bold;
color:#d63384;
}

/* INPUT */
.input-box{
width:100%;
padding:12px;
border:1px solid #ffb6c1;
border-radius:10px;
background:#f4f6fb;
font-size:15px;
}

/* READONLY */
input[readonly]{
background:#eee;
}

/* BUTTON */
.btn{
width:100%;
margin-top:18px;
padding:14px;
background:#ff5c93;
border:none;
border-radius:10px;
color:white;
font-size:18px;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

.btn:hover{
background:#e64980;
}

/* BACK BUTTON */
.back{
display:block;
text-align:center;
margin-top:18px;
padding:12px;
border:1px solid #ffb6c1;
border-radius:10px;
text-decoration:none;
color:#d63384;
background:white;
}

.back:hover{
background:#fff0f5;
}

</style>
</head>

<body>

<div class="container">

<h2>✏ Update Marks</h2>

<!-- FETCH FORM -->

<form action="FetchMarkServlet" method="post">

<label>Search Student by ID</label>

<input type="number"
name="id"
class="input-box"
placeholder="Enter Student ID"
required>

<input type="submit"
value="Fetch Marks"
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
placeholder="Enter New Marks"
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