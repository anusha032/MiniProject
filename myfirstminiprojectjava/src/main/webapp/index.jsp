<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Mark Management System</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial, sans-serif;
}

body{
background:#fff0f5;
color:#333;
padding:20px;
}

/* HEADER */

.header{
text-align:center;
margin-bottom:20px;
}

.header h1{
font-size:40px;
letter-spacing:3px;
padding:15px 30px;
display:inline-block;
border:2px solid #ff69b4;
border-radius:15px;
background:#ffffff;
color:#ff1493;
box-shadow:0 5px 15px rgba(255,105,180,0.2);
}

/* BANNER */

.banner{
width:100%;
max-width:1100px;
margin:20px auto;
border-radius:20px;
overflow:hidden;
box-shadow:0 10px 20px rgba(255,182,193,0.4);
}

.banner img{
width:100%;
height:280px;
object-fit:cover;
display:block;
}

/* GRID */

.container{
max-width:1100px;
margin:30px auto;
display:grid;
grid-template-columns:repeat(auto-fit, minmax(240px, 1fr));
gap:30px;
}

/* CARD */

.card{
background:#ffffff;
border-radius:18px;
padding:25px;
text-align:center;
border:1px solid #ffc0cb;
transition:0.3s ease;
box-shadow:0 8px 18px rgba(255,182,193,0.3);
}

.card:hover{
transform:translateY(-8px) scale(1.02);
border:1px solid #ff69b4;
box-shadow:0 12px 25px rgba(255,105,180,0.4);
}

.card img{
width:65px;
height:65px;
margin-bottom:12px;
background:#ffe4ec;
padding:10px;
border-radius:50%;
border:2px solid #ff69b4;
}

.card h2{
font-size:20px;
margin-bottom:10px;
color:#d63384;
}

.card p{
font-size:13px;
color:#555;
margin-bottom:15px;
line-height:1.5;
}

/* BUTTON */

.btn{
display:inline-block;
padding:10px 18px;
background:#ff69b4;
color:white;
border-radius:10px;
text-decoration:none;
font-weight:bold;
transition:0.3s;
}

.btn:hover{
background:#e754a3;
}

/* FOOTER */

.footer{
text-align:center;
margin-top:40px;
color:#d63384;
font-size:13px;
}

</style>

</head>

<body>

<!-- HEADER -->

<div class="header">
<h1>MARK MANAGEMENT SYSTEM</h1>
</div>

<!-- BANNER -->

<div class="banner">
<img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1200&q=80">
</div>

<!-- CARDS -->

<div class="container">

<!-- ADD -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/1828/1828919.png">

<h2>Add Marks</h2>

<p>Add new student marks into database.</p>

<a href="markadd.jsp" class="btn">Open</a>
</div>

<!-- UPDATE -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/1827/1827933.png">

<h2>Update Marks</h2>

<p>Update marks using Student ID.</p>

<a href="markupdate.jsp" class="btn">Open</a>
</div>

<!-- DELETE -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/1214/1214428.png">

<h2>Delete Record</h2>

<p>Delete student record easily.</p>

<a href="markdelete.jsp" class="btn">Open</a>
</div>

<!-- DISPLAY -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/942/942748.png">

<h2>Display Marks</h2>

<p>Search or display all records.</p>

<a href="display.jsp" class="btn">Open</a>
</div>

<!-- REPORTS -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">

<h2>Reports</h2>

<p>Generate custom student reports.</p>

<a href="reports.jsp" class="btn">Open</a>
</div>

<!-- VIEW -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921222.png">

<h2>View Records</h2>

<p>View complete marks table.</p>

<a href="view.jsp" class="btn">Open</a>
</div>

<!-- FAIL RECORD -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/463/463612.png">

<h2>Fail Records</h2>

<p>View students who scored below pass mark.</p>

<a href="failrecords.jsp" class="btn">Open</a>
</div>

<!-- PASS RECORD -->

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/845/845646.png">

<h2>Pass Records</h2>

<p>View students who scored above pass mark.</p>

<a href="passrecords.jsp" class="btn">Open</a>
</div>

</div>

<!-- FOOTER -->

<div class="footer">
Student Marks Management System © 2026
</div>

</body>
</html>