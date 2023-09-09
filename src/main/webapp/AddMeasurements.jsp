<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TailoringSystem</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,700|Raleway:300,400,400i,500,500i,700,800,900" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: eBusiness - v4.8.0
  * Template URL: https://bootstrapmade.com/ebusiness-bootstrap-corporate-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style type="text/css">


#portfolio .btn-get-started {
  font-weight: 500;
  font-size: 16px;
  letter-spacing: 1px;
  display: inline-block;
  padding: 8px 32px;
  border-radius: 50px;
  transition: 0.5s;
  margin: 10px;
  color: #fff;
  background: #ff0080;
}


</style>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
        <h1><a href="index.html"><span>Tailoring</span>System</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

       <nav id="navbar" class="navbar">
         <ul>
          <button onclick="history.back()" ><b>Back</b></button>
          
           <li><a class="nav-link scrollto" href="MensClothing.jsp">Men</a></li>
          <li><a class="nav-link scrollto" href="WomensClothing.jsp">Women</a></li>       
          <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String name=(String)session.getAttribute("name");  
	                out.print(" "+name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="ViewProfile.jsp">View Profile</a></li>            
              <li><a href="ChangePassword.jsp">Change Password</a></li>
              <li><a href="LogoutController">Logout</a></li>            
            </ul>
          </li>         
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->


<br><br>
 
    <!-- ======= Portfolio Section ======= -->
    <div id="portfolio" class="portfolio-area area-padding fix">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Add Measurements</h2>
            </div>
          </div>
        </div>
        <div class="row">
        <div class="col-lg-6">
       <form action="UserRegistrationController" method="post" class="formone">
          <div class="row">
          
          <%
                     Connection con=DBConnection.getConnection();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from clothtype");
                     //while(rs.next())
                     if(rs.next() == false) {
                    	%>
									<h4 style="text-align: right; margin-right: 70px">
										<b>No Users Present</b>
									</h4>
									<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
            <div class="form-group mt-1">
            <lable>Suit Type</lable>
              <input type="text" name="name" class="form-control" id="name" value="${clothtype}"  readonly>
            </div>
            <div class="form-group mt-1">
            <lable>Upper</lable>
              <input type="text" name="name" class="form-control" id="name" placeholder="Your name" required>
            </div>
           
            <div class="form-group mt-1">
              <input type="text" name="address" class="form-control" id="address" placeholder="Your address" required>
            </div>
           
            <div class="form-group mt-1">
              <input type="text" name="mobileno" class="form-control" id="mobileno" placeholder="Your Mobile Number" required>
            </div>
            <div class="form-group mt-1">
              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
            </div>
            <div class="form-group mt-1">
              <input type="password" name="password" class="form-control" id="password" placeholder="Your password" required>
            </div>
            
          </div>
          <br>
       <div class="text-center"><button class="btn-get-started" type="submit">Add</button><br>
      
       </div>
        </form>
        </div>
        <%}%><%count++; }while(rs.next());}%>
        <div class="col-lg-6">
         <img src="assets/img/measure.jpg" alt="" width="400px" height="200px"/>
         </div>
          

         
        </div>
      </div>
    </div><!-- End Portfolio Section -->


  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>