<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student Record</title>

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
background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

/* MAIN BOX */

.container{
width:430px;
background:white;
padding:35px;
border-radius:22px;
box-shadow:0 15px 35px rgba(0,0,0,0.25);
text-align:center;
}

h2{
color:#ff4b2b;
margin-bottom:25px;
font-size:30px;
}

label{
display:block;
text-align:left;
font-weight:bold;
margin-bottom:8px;
color:#333;
}

.input-box{
width:100%;
padding:13px;
border:2px solid #ddd;
border-radius:12px;
font-size:16px;
outline:none;
}

.input-box:focus{
border-color:#ff4b2b;
}

.btn{
width:100%;
margin-top:22px;
padding:14px;
border:none;
border-radius:12px;
background:linear-gradient(to right,#ff416c,#ff4b2b);
color:white;
font-size:18px;
font-weight:bold;
cursor:pointer;
}

/* POPUP */

.popup{
position:fixed;
top:0;
left:0;
width:100%;
height:100%;
background:rgba(0,0,0,0.5);
display:none;
justify-content:center;
align-items:center;
}

.popup-box{
background:white;
width:350px;
padding:30px;
border-radius:20px;
text-align:center;
animation:pop 0.3s ease;
}

@keyframes pop{
from{
transform:scale(0.7);
opacity:0;
}
to{
transform:scale(1);
opacity:1;
}
}

.popup-box h3{
color:#ff416c;
margin-bottom:15px;
font-size:24px;
}

.popup-box p{
margin-bottom:25px;
font-size:16px;
color:#555;
}

.popup-btn{
padding:12px 25px;
border:none;
border-radius:10px;
font-size:16px;
font-weight:bold;
cursor:pointer;
margin:8px;
}

.yes{
background:#28a745;
color:white;
}

.cancel{
background:#dc3545;
color:white;
}

a{
display:block;
margin-top:20px;
text-decoration:none;
font-weight:bold;
color:#ff416c;
}

</style>

<script>

function showPopup()
{
    let id = document.getElementById("id").value;

    if(id=="")
    {
        alert("Please Enter Student ID");
        return false;
    }

    document.getElementById("popup").style.display="flex";

    return false;
}

function deleteRecord()
{
    document.getElementById("deleteForm").submit();
}

function closePopup()
{
    document.getElementById("popup").style.display="none";
}

</script>

</head>

<body>

<div class="container">

<h2>Delete Student Record</h2>

<form id="deleteForm"
action="DeleteMarkServlet"
method="post">

<label>Student ID</label>

<input type="text"
id="id"
name="id"
class="input-box"
placeholder="Enter Student ID">

<input type="button"
value="Delete Record"
class="btn"
onclick="showPopup()">

</form>

<a href="index.jsp">← Back to Home</a>

</div>

<!-- POPUP -->

<div class="popup" id="popup">

<div class="popup-box">

<h3>Confirm Delete</h3>

<p>Do you want to delete this record?</p>

<button class="popup-btn yes"
onclick="deleteRecord()">
YES
</button>

<button class="popup-btn cancel"
onclick="closePopup()">
CANCEL
</button>

</div>

</div>

</body>
</html>