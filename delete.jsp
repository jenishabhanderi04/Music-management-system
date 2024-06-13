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
<title>Insert title here</title>
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
String sessionid = (String)session.getAttribute("user_id");
out.print("Hi "+session_name);
out.print("Hi "+sessionid);
%>
<a href="logout.jsp">logout</a>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/music","root","");


try{
	if(request.getParameter("delete")!= null)
	{
		String id = request.getParameter("delete");
		 PreparedStatement ps = con.prepareStatement("delete from playlist where id = ?;");
			
		    ps.setString(1,id);
		 
		    int x = ps.executeUpdate();
	  
		    response.sendRedirect("index.jsp");
	}
}
catch(Exception e)
{
	out.println(e);
}

%>

</body>
</html>