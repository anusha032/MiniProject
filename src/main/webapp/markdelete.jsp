<html>
<head>
<meta charset="UTF-8">
<title>Delete Student Record</title>

<style>

body{
margin:0;
font-family:Arial;
background: linear-gradient(135deg, #ff416c, #ff4b2b);
display:flex;
justify-content:center;
align-items:center;
height:100vh;
}

.container{
width:380px;
background:white;
padding:30px;
border-radius:18px;
box-shadow:0 10px 25px rgba(0,0,0,0.3);
text-align:center;
}

h2{
color:#ff4b2b;
margin-bottom:20px;
}

label{
display:block;
text-align:left;
font-weight:bold;
margin-bottom:5px;
color:#333;
}

input[type=text]{
width:100%;
padding:12px;
border:1px solid #ccc;
border-radius:10px;
outline:none;
transition:0.3s;
}

input[type=text]:focus{
border-color:#ff4b2b;
box-shadow:0 0 5px rgba(255,75,43,0.4);
}

input[type=submit]{
width:100%;
margin-top:20px;
padding:12px;
border:none;
border-radius:10px;
background:linear-gradient(to right,#ff416c,#ff4b2b);
color:white;
font-size:16px;
cursor:pointer;
transition:0.3s;
}

input[type=submit]:hover{
transform:scale(1.03);
}

a{
display:block;
margin-top:15px;
text-decoration:none;
color:#ff4b2b;
font-weight:bold;
}

a:hover{
color:#c92a1b;
}

</style>

</head>

<body>

<div class="container">

<h2>Delete Student Record</h2>

<form action="DeleteMarkServlet" method="post">

<label>Student ID</label>
<input type="text" name="id" placeholder="Enter Student ID" required>

<input type="submit" value="Delete Record">

</form>

<a href="index.jsp">Back to Home</a>

</div>

</body>
</html>
