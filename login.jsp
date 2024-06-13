<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login Form</title>
<link rel="stylesheet" href="regs.css">
<link rel="stylesheet" href="style2.css">
<style>
.er{
color:red;
text-align:center;
margin-top:80px;
margin-bottom:0px;
}
</style>
</head>
<body>
<%



response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setHeader("Pragma","no-cache");
%>
<!-- cookies -->
 <%
    Cookie[] cookies = request.getCookies();
    String username="";
    String passw = "";
    if(cookies!=null)
    {
      for(int i=0;i<cookies.length;i++){
        Cookie cookie = cookies[i];
        if(cookie.getName().equals("username-cookie"))
        {
            username= cookie.getValue();
        }
        else if(cookie.getName().equals("password-cookie"))
        {
            passw= cookie.getValue();
        }
      }
    }
   %>
   
   <%
    String user=request.getParameter("email");
    String pass=request.getParameter("password");

    String rememberMe=  request.getParameter("rememberMe");
    if(rememberMe!=null)
    {
        Cookie usernameCookie = new Cookie("username-cookie", user);
        Cookie passwordCookie = new Cookie("password-cookie", pass);
        usernameCookie.setMaxAge(24*60*60);
        passwordCookie.setMaxAge(24*60*60);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        }
    %> 
<!-- end -->



<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/music","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("email") != null || request.getParameter("password") != null)
		{
			String uname = request.getParameter("email");
			String password = request.getParameter("password");

			// Hash the entered password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(password.getBytes());
				byte[] hash = md.digest();
				String hashpass = new String(Base64.getEncoder().encode(hash));

			PreparedStatement ps = con.prepareStatement("SELECT * FROM registration WHERE email = ? and password = ?");
			ps.setString(1, uname);
			ps.setString(2, hashpass);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
			session.setAttribute("user_email", uname);
			session.setAttribute("user_id", rs.getString("rid"));
			session.setAttribute("user_name", rs.getString("fname"));
			
			response.sendRedirect("index.jsp");
		} else {
			
			%>
			<p class="er"><%out.print("invalid username and password!"); %></p>
			<% 
			
		}
		}
		else
		{
			%>
			<p class="er"><%out.print("invalid username and password!"); %></p>
			<% 
			

		}
		
	}
	
	}
catch(Exception e)
{
 out.println("error" +e);
}

%>
   <section id="header">
    <div class="header container">
      <div class="nav-bar">
        <div class="brand">
          <a href="home.jsp">
            <h1><span>M</span>usic <span></span></h1>
          </a>
        </div>
        <div class="nav-list">
          <div class="hamburger">
            <div class="bar"></div>
          </div>
         
        </div>
      </div>
    </div>
  </section>
  <br><br>
<div id="container">
        <!-- Form Wrap Start -->
        <div class="form-wrap">
            <h1>Sign In</h1>
            
            <!-- Form Start -->
            <form method="post" onsubmit ="return check()">
           
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" value ="<%= username %>">
                    <span id = "user-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="<%= passw %>">
                    <span id = "pass-message" style="color:red"> </span>
                </div>
                
                 <br>
                    <input type="checkbox" name="rememberMe" id="rememberMe" value ="true">Remember me

                <button type="submit" name="submit">Sign Up</button>
                
                
                 
                  
                    
           
                <p class="bottom-text">
                    By Clicking the Sign Up Button, you agree to our
                    <a href="#">Term & Conditions</a> and <a href="#">Primary Policy</a>
                </p>
            </form>
            <!-- Form Close -->
        </div>
        <!-- Form Wrap Close -->
        <footer>
            <p>Already Have an Account? <a href="registration.jsp">Registration Here</a></p>
        </footer>
    </div>
    <!-- Container Close -->

</body>
<script>  
function check() {  
	var uname = document.getElementById("email").value;
	if(uname == ""){
  		document.getElementById("user-message").innerHTML = "**Fill the username please!";  
     	return false;
  	}
	
  	var pw = document.getElementById("password").value;  
  	//check empty password field  
  	if(pw == "") {  
     	document.getElementById("pass-message").innerHTML = "**Fill the password please!";  
     	return false;  
  	}  
  if(uname != null || pw != null)
	  {
	    document.getElementById("er-message").innerHTML = "**Incorrect Username and Password!";  
     	return false;
	  
	  }
  	
  }

</script>

</html>