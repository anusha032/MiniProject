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
background: #0a0a0a;
color:white;
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
border:2px solid #fff;
border-radius:15px;
background:#111;
box-shadow:0 0 20px rgba(255,255,255,0.1);
}

/* BANNER */
.banner{
width:100%;
max-width:1100px;
margin:20px auto;
border-radius:20px;
overflow:hidden;
box-shadow:0 10px 25px rgba(255,255,255,0.1);
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
background: linear-gradient(145deg, #111, #1a1a1a);
border-radius:18px;
padding:25px;
text-align:center;
border:1px solid #2b2b2b;
transition:0.3s ease;
box-shadow:0 8px 18px rgba(0,0,0,0.6);
}

.card:hover{
transform:translateY(-10px);
border:1px solid #fff;
box-shadow:0 15px 30px rgba(255,255,255,0.08);
}

.card img{
width:65px;
height:65px;
margin-bottom:12px;
background:#222;
padding:10px;
border-radius:50%;
border:2px solid #fff;
}

.card h2{
font-size:20px;
margin-bottom:10px;
}

.card p{
font-size:13px;
color:#bbb;
margin-bottom:15px;
line-height:1.4;
}

/* BUTTON */
.btn{
display:inline-block;
padding:10px 18px;
background:#fff;
color:#000;
border-radius:10px;
text-decoration:none;
font-weight:bold;
transition:0.3s;
}

.btn:hover{
background:#ccc;
}

/* FOOTER */
.footer{
text-align:center;
margin-top:40px;
color:#888;
font-size:13px;
}

</style>
</head>

<body>

<div class="header">
<h1>MARK MANAGEMENT SYSTEM</h1>
</div>

<div class="banner">
<img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1200&q=80">
</div>

<div class="container">

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/1828/1828919.png">
<h2>Add Marks</h2>
<p>Add new student marks into database.</p>
<a href="markadd.jsp" class="btn">Open</a>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/1827/1827933.png">
<h2>Update Marks</h2>
<p>Update marks using Student ID.</p>
<a href="update.jsp" class="btn">Open</a>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/1214/1214428.png">
<h2>Delete Record</h2>
<p>Delete student record easily.</p>
<a href="delete.jsp" class="btn">Open</a>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/942/942748.png">
<h2>Display Marks</h2>
<p>Search or display all records.</p>
<a href="display.jsp" class="btn">Open</a>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png">
<h2>Reports</h2>
<p>Generate custom student reports.</p>
<a href="reports.jsp" class="btn">Open</a>
</div>

<div class="card">
<img src="https://cdn-icons-png.flaticon.com/512/2921/2921222.png">
<h2>View Records</h2>
<p>View complete marks table.</p>
<a href="view.jsp" class="btn">Open</a>
</div>

</div>

<div class="footer">
Student Marks Management System © 2026
</div>

</body>
</html>
