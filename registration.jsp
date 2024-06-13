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
<title>Registration Form</title>
<link rel="stylesheet" href="regs.css">
<link rel="stylesheet" href="style2.css">

</head>
<body>
<%@ page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/music","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("fname") != null || request.getParameter("lname") != null || request.getParameter("email") != null ||request.getParameter("password") != null || request.getParameter("date") != null ||request.getParameter("gender") != null)
		{
			Statement st =con.createStatement();
//			String rid = request.getParameter("rid");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String date = request.getParameter("date");
			String gender = request.getParameter("gender");
			
			//hash password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
  				md.update(password.getBytes());
  				byte[] hash = md.digest();
  				String hashpass = new String(Base64.getEncoder().encode(hash));
  				
  				
		    PreparedStatement ps = con.prepareStatement("insert into registration(fname, lname, email, password,date,gender) values(?,?,?,?,?,?);");
		    ps.setString(1,fname);
		    ps.setString(2,lname);
		    ps.setString(3,email);
		    ps.setString(4,hashpass);
		    ps.setString(5,date);
		    ps.setString(6,gender);
		    int x = ps.executeUpdate();
		    response.sendRedirect("login.jsp");
		  
		}
		else
		{
			/* out.print("enter the details"); */
			/* String er = "enter the details"; */
		}
		
	}
	else
	{
		//out.print("enter the details");
	}
	}
catch(Exception e)
{
// out.println("error" +e);
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
            <h1>Sign Up</h1>
            
            <!-- Form Start -->
            <form method="post" onsubmit ="return verifyPassword()">
                <div class="form-group">
                    <label for="first-name">First Name</label>
                    <input type="text" name="fname" id="fname">
                   <span id = "uname-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="last-name">Last Name</label>
                    <input type="text" name="lname" id="lname">
                    <span id = "lname-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email">
                    <span id = "email-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" >
                     <span id = "pass-message" style="color:red"> </span>
                </div>
                
                <div class="form-group">
                    <label for="cpass">Date of Birth</label>
                    <input type="date" name="date" id="date">
                     <span id = "date-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="cpass">Gender</label>

                </div>
                <input type="radio" name="gender"  value="male" id="male">Male
                <input type="radio" name="gender"  value = "female" id="female">Female
                <span id = "gender-message" style="color:red"> </span>
                
                <button type="submit" name="submit" id="submit">Sign Up</button>
                <p class="bottom-text">
                    By Clicking the Sign Up Button, you agree to our
                    <a href="#">Term & Conditions</a> and <a href="#">Primary Policy</a>
                </p>
            </form>
            
            <!-- Form Close -->
        </div>
        <!-- Form Wrap Close -->
        <footer>
            <p >Already Have an Account? <a href="login.jsp">Login Here</a></p>
        </footer>
    </div>
    <!-- Container Close -->
    
</body>
<script>  
function verifyPassword() {  
	
	 var decimal=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
  	var pw = document.getElementById("password").value;  
  	var uname = document.getElementById("fname").value; 
  	var lname = document.getElementById("lname").value; 
  	var email = document.getElementById("email").value;
  	var date = document.getElementById("date").value;
  	
  	
  	if(uname == "") {  
  	     document.getElementById("uname-message").innerHTML = "**Fill the username please!";  
  	     return false;  
  	  }  
  	
  	if(lname == "") {  
  	     document.getElementById("lname-message").innerHTML = "**Fill the lastname please!";  
  	     return false;  
  	  }  
  	if(email == "") {  
 	     document.getElementById("email-message").innerHTML = "**Fill the email please!";  
 	     return false;  
 	  }  
  	 
  //check empty password field  
  if(pw == "") {  
     document.getElementById("pass-message").innerHTML = "**Fill the password please!";  
     return false;  
  }  
  
  //To check a password between 8 to 15 characters which contain at least one lowercase letter, 
  //one uppercase letter, one numeric digit, and one special character
   if(!pw.match(decimal)){
	   document.getElementById("pass-message").innerHTML = "**Follow the rules for password";  
	     return false; 
   }
 //minimum password length validation  
  if(pw.length < 8) {  
     document.getElementById("pass-message").innerHTML = "**Password length must be atleast 8 characters";  
     return false;  
  }  
  
//maximum length of password validation  
  if(pw.length > 15) {  
     document.getElementById("pass-message").innerHTML = "**Password length must not exceed 15 characters";  
     return false;  
  } else {  
     
  }  
  if(date == "") {  
	     document.getElementById("date-message").innerHTML = "**Fill the date please!";  
	     return false;  
	  } 

}   


 

</script>
</html>