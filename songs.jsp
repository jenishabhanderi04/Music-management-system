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
<meta charset="ISO-8859-1">
<title>songs</title>
<style>
.f{
margin-left:20px;
}

.p
{

color:white;
font-size:15px;
text-align:center;
padding-top:15px;
font-weight:bold;

}
p{
color:red;
}
.s{

  height:50px;
 background: #49c1a2;

}
 .edit {
    text-decoration: none;
    padding: 2px 5px;
    background: #49c1a2;
    color: white;
    border-radius: 3px;
    font-size: 20px;
    .f{
    margin-left:20px;
    
    }
</style>
</head>
<link rel="stylesheet" href="header.css">
<body>
<!-- heder start -->
 <header class="header" id="header">
        <div class="navbar">
        
            <div class="logo">
               <h3>Music management system</h3>
             </div>
            <nav class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                    <li><a href="logout.jsp" class="nav-link">Logout</a></li>
                    <li><a class="nav-link"> <%= session.getAttribute("user_name") %></a></li>
     
                </ul>
               
            </nav>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>
    <br><br><br><br>
<!-- heder end -->

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
String sessionid = (String)session.getAttribute("user_id");
/* out.print("Hi "+session_name);
out.print("Hi "+sessionid); */
%>

<div class="s">
<p class="p">Songs<p>
</div>

<%


try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/music","root","");
	
	if(request.getParameter("submit") != null)
	{

		if(request.getParameter("ch") != null)
		{
			Statement st =con.createStatement();
    
			String song="";
			String ch[]=request.getParameterValues("ch");
			for(int i=0;i< ch.length;i++)
			{
				song+=ch[i]+",";
			}	
			    PreparedStatement ps = con.prepareStatement("insert into playlist (song,userid) values(?,?);");
		
			    ps.setString(1,song);
			    ps.setString(2,sessionid);
			    int x = ps.executeUpdate();
		  
		        out.println("insert sussecefully");
		        response.sendRedirect("index.jsp");
		}
		else
		{
			 out.println("<p>select the song<p>"); 
		}
	}
	else
	{
		/* out.println("insert the details"); */
	}
	}
catch(Exception e)
{
// out.println("error" +e);
}
%>

<br>
<form method="post">
<div class="f">

<input type="checkbox" name="ch" value="Aankhon Ki Gustakhiyan">Aankhon Ki Gustakhiyan<br><br>
<input type="checkbox" name="ch" value="Barbaadiyaan">Barbaadiyaan<br><br>
<input type="checkbox" name="ch" value="Badtameez Dil">Badtameez Dil<br><br>
<input type="checkbox" name="ch" value="Chura Ke Dil Mera Goriya Chali">Chura Ke Dil Mera Goriya Chali <br><br>
<input type="checkbox" name="ch" value="Dum Maaro Dum">Dum Maaro Dum <br><br>
<input type="checkbox" name="ch" value="Doobey">Doobey <br><br>
<input type="checkbox" name="ch" value="Dilbar Dilbar">Dilbar Dilbar <br><br>
<input type="checkbox" name="ch" value="Ghar Aa Ja Pardesi">Ghar Aa Ja Pardesi <br><br>
<input type="checkbox" name="ch" value="Ghoomar">Ghoomar <br><br>
<input type="checkbox" name="ch" value="Jeenhe Mera Dil Luteya ">Jeenhe Mera Dil Luteya  <br><br>
<input type="checkbox" name="ch" value="Jai Jai Shivshankar">Jai Jai Shivshankar <br><br>
<input type="checkbox" name="ch" value="Kyoon Dikhe Mujhe Tu Sirhaane Mere">Kyoon Dikhe Mujhe Tu Sirhaane Mere <br><br>
<input type="checkbox" name="ch" value="Makhna">Makhna <br><br>


<input type="submit" name="submit" value="Add Playlist" class="edit">
</div>
</form>

</body>



</html>