<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Delete Student Record</title>

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
background:linear-gradient(135deg,#ff416c,#ff4b2b);
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
color:#ff416c;
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
border-color:#ff416c;
outline:none;
box-shadow:0 0 8px rgba(255,65,108,0.3);
}

.btn{
width:100%;
padding:14px;
margin-top:22px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#ff416c,#ff4b2b);
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
margin-top:18px;
text-decoration:none;
font-weight:bold;
color:#ff416c;
}

a:hover{
color:#ff4b2b;
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
    let id = document.forms["f"]["id"].value;

    if(id=="")
    {
        alert("Student ID is required");
        return false;
    }

    if(isNaN(id))
    {
        alert("Student ID must be numeric");
        return false;
    }

    return confirm("Are you sure you want to delete this record?");
}
</script>

</head>

<body>

<div class="container">

<h2>Delete Student Record</h2>

<form name="f" action="DeleteMarkServlet" method="post"
onsubmit="return validateForm()">

<label>Student ID</label>

<input type="text" name="id" class="input-box"
placeholder="Enter Student ID">

<input type="submit" value="Delete Record" class="btn">

</form>

<div class="note">
Enter valid Student ID to delete record
</div>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>