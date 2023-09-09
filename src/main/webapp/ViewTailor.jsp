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


#pricing .btn-get-started {
  font-weight: 500;
  font-size: 16px;
  letter-spacing: 1px;
  display: inline-block;
  padding: 8px 32px;
  border-radius: 50px;
  transition: 0.5s;
  margin: 10px;
  color: #fff;
  background: #3ec1d5;
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
          <li><a class="nav-link scrollto Active" href="">Home</a></li>
          <li><a class="nav-link scrollto" href="Notification.jsp">View Notification</a></li>
          <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String name=(String)session.getAttribute("name");  
	                out.print(" "+name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="ViewTailor.jsp">View Profile</a></li>            
              <li><a href="ChangePasswordTailor.jsp">Change Password</a></li>
              <li><a href="LogoutController">Logout</a></li>            
            </ul>
          </li>         
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

  <br><br>
 <!-- ======= Contact Section ======= -->
    <div id="pricing" class="pricing-area area-padding">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Profile</h2>
            </div>
          </div>
        </div>
       <center> <div class="row">
 
       <%
                     Connection con=DBConnection.getConnection();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from tailor");
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
			
    
         <center><div class="row gutters-sm">
            
            <div class="padding">
           <!--  <div class="container center_div"> -->
            <div class="col-md-8" align="center">
              <div class="card mb-3">
                <div class="card-body">
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Name</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String name=(String)session.getAttribute("name"); 	          
	                out.print(" "+name+""); }   %>
                    </div>
                  </div>
                  <hr>
                  
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Address</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String address=(String)session.getAttribute("address"); 	          
	                out.print(" "+address+""); }   %>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Mobile No</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String mobileno=(String)session.getAttribute("mobileno"); 	          
	                out.print(" "+mobileno+""); }   %>
                    </div>
                  </div>
               
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <label class="mb-0">Email</label>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <%response.setContentType("text/html");  
                      if(session!=null){  
	                String email=(String)session.getAttribute("email"); 	          
	                out.print(" "+email+""); }   %>
                    </div>
                  </div>
                  
                 
                </div>
              </div><%}%><%count++; }while(rs.next());}%>
</div>
             
              </div>
</div></center> 
					</div>
				</div>
			</div>
		</section>
        
       
        
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