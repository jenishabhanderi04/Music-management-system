<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="header.css">
<meta charset="ISO-8859-1">
<title>home</title>
  <style>
  	.link {
     list-style-type: none;
     padding-left: 500px;
     margin-top: 20px;

}
.link a{
text-decoration: none;
background-color:hotpink;
display: inline;
float:left;
color:white;
font-size: 20px;
padding: 5px;
margin-left: 5px;
height: 40px;
width: 40px;
padding-left: 15px;
}
.link a:hover{
background-color:white;
color: #49c1a2;


}

.link ul li {
    display: none;
}

    .add {
    text-decoration: none;
    padding: 2px 5px;
  
    background: hotpink;
    color: white;
    border-radius: 3px;
    font-size: 20px;
    font-family: Arial, Helvetica, sans-serif;
    

}
.u{
/*  height:43px; */
 width:90px;
}
  
  .edit {
    text-decoration: none;
    padding: 2px 5px;
    background: #49c1a2;
    color: white;
    border-radius: 3px;
}

.del {
    text-decoration: none;
    padding: 2px 5px;
    color: white;
    border-radius: 3px;
    background: #800000;
}

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 20px;
   margin-bottom: 20px;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}
 

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #49c1a2;
  color: white;
}
h1{
  color: #49c1a2;
  text-align: center;
}
</style>
</head>
<body>


<%
response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("user_id")== null)
{
response.sendRedirect("login.jsp");	
}
%>

<%
String session_name = (String)session.getAttribute("user_email");
String session_user = (String)session.getAttribute("user_name");
String sessionid = (String)session.getAttribute("user_id");
/* out.print("Hi "+session_name);
out.print("Hi "+sessionid); */
%>
<!-- <a href="logout.jsp">logout</a><br><br><br> -->



<!-- heder start -->
 <header class="header" id="header">
        <div class="navbar">
            <div class="logo">
               <!--  <img src="img/logo.svg"> -->
               <h3>Music management system</h3>
               
            </div>
            <nav class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li><a href="songs.jsp" class="nav-link">Add Playlist</a>
                    <li><a href="logout.jsp" class="nav-link">Logout</a></li>
                    <li><a class="nav-link"><%= session.getAttribute("user_name") %></a></li>
                </ul>
               
            </nav>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>
<!-- heder end -->


<br><br><br>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/music","root","");

//display the data


Statement s = (Statement)con.createStatement();
ResultSet rs = s.executeQuery("select * from playlist where userid="+sessionid+"");
%>

<table id ="customers">

<tr>
<th>Playlist</th>
<th class="u">Update</th>
<th class="u">Delete</th>
</tr>

<%
while(rs.next())
{
%>
<tr>
<td> <%= rs.getString(2) %></td>
<td><a href="update.jsp?update=<%= rs.getString(1)%>" class="edit">Update</a></td>
<td><a href="delete.jsp?delete=<%= rs.getString(1)%> " class="del">Delete</a></td>


</tr>
<%
}%>



</table>

</body>
</html>