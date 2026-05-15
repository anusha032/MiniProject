<%@ page import="java.sql.*" %>
<%@ page import="com.dao.MarkDAO" %>

<html>
<head>
<title>Failed Students</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #eef2f3, #8e9eab);
    margin: 0;
    padding: 20px;
}

h2 {
    text-align: center;
    color: #333;
}

.table-container {
    width: 80%;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}

table {
    width: 100%;
    border-collapse: collapse;
    overflow: hidden;
    border-radius: 10px;
}

th {
    background-color: #4CAF50;
    color: white;
    padding: 12px;
    text-transform: uppercase;
}

td {
    padding: 10px;
    text-align: center;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #d1ecf1;
    transition: 0.3s;
}

.back-btn {
    display: block;
    width: 120px;
    margin: 20px auto;
    text-align: center;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border-radius: 8px;
}

.back-btn:hover {
    background-color: #45a049;
}
</style>

</head>

<body>

<h2>Failed Students List</h2>

<div class="table-container">
<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Date</th>
</tr>

<%
try{
Connection con = MarkDAO.getConnection();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from StudentMarks where Marks < 35");

while(rs.next()){
%>

<tr>
<td><%= rs.getInt("StudentID") %></td>
<td><%= rs.getString("StudentName") %></td>
<td><%= rs.getString("Subject") %></td>
<td><%= rs.getInt("Marks") %></td>
<td><%= rs.getDate("ExamDate") %></td>
</tr>

<%
}
con.close();
}catch(Exception e){
out.println(e);
}
%>

</table>
</div>

<a href="index.jsp" class="back-btn">Back</a>

</body>
</html>