<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>home</title>
</head>
<body>
    <form id="form1" runat="server">
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
          <ul>
            
            <li><a href="login.jsp" data-after="Projects">Login</a></li>
            <li><a href="registration.jsp" data-after="About">Registration</a></li>
        
          </ul>
        </div>
      </div>
    </div>
  </section>
  <!-- End Header -->


  <!-- Hero Section  -->
  <section id="hero">
    <div class="hero container">
      <div>
          <h1>Hello, <span></span></h1>
        <h1>Welcome To <span></span></h1>
        <h1>Music App <span></span></h1>
        <a href="songs.jsp" type="button" class="cta">Add Playlist</a> 
      </div>
    </div>
  </section>
  
  
  <script src="app.js"></script>

    </form>
</body>
</html>
