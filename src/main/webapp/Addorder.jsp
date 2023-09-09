<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title></title>
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
  
  <style>
  #team .btn-get-started {
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
#team {
  height:100vh;
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

 <!-- ======= Team Section ======= -->
    <div id="team" class="our-team-area area-padding">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Add Order</h2>
            </div>
          </div>
        </div>
        <div class="row">
        <%


                try{
                	
                String dressname=request.getParameter("dressname");
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                     /* ResultSet rs=st.executeQuery("select * from addwdresswstyle where dressname='"+dressname+"'");  */
                    ResultSet rs=st.executeQuery("select addordercloth.id,addordercloth.dressname,addordercloth.price,addorderfabric.fabricname,addordercloth.status from addordercloth inner join addorderfabric on addordercloth.email=addorderfabric.email");
                     
                    //while(rs.next())
                    	
                    	
                    while(rs.next()) {
                   	%>
          <div class="col-md-12 col-sm-12	 col-xs-12">
            <div class="single-team-member">
              <div class="team-img" style="font-size:20px;">
             
               <form action="AddOrderController" method="post" class="formone">
          <div class="row">
            
            <div class="col-md-3 form-group">
              <label>Dress Name</label>
              <input type="text" name="dressname" class="form-control" id="dressname" value="<%=rs.getString(2) %>" readonly> 
            </div>
           
            <div class="col-md-3 form-group">
               <label>Price</label>
              <input type="text" name="price" class="form-control" id="price" value="<%=rs.getString(3) %>" readonly>
            </div>
            <div class="col-md-3 form-group">
              <label>Fabric Name</label>
              <input type="text" name="fabricname" class="form-control" id="fabricname" value="<%=rs.getString(4) %>" readonly>   
            </div>
            <div class="col-md-3 form-group">
            <label>Shoulder</label>
              <input type="text" name="shoulder" class="form-control" id="shoulder" placeholder="shoulder" required>
            </div>
            <div class="col-md-3 form-group mt-3 mt-md-0">
            <label>Back</label>
              <input type="text" class="form-control" name="back" id="back" placeholder="Back" required>
            </div>
            <div class="col-md-3 form-group">
            <label>Arm Hole</label>
              <input type="text" name="armhole" class="form-control" id="armhole" placeholder="armhole" required>
            </div>
             <div class="col-md-3 form-group">
             <label>Neck</label>
              <input type="text" name="neck" class="form-control" id="neck" placeholder="neck" required>
            </div>
             <div class="col-md-3 form-group">
             <label>Waist</label>
              <input type="text" name="waist" class="form-control" id="waist" placeholder="waist" required>
            </div>
             <div class="col-md-3 form-group">
             <label>Bottom</label>
              <input type="text" name="bottom" class="form-control" id="bottom" placeholder="bottom" required>
            </div>
             <div class="col-md-3 form-group">
             <label>Top Length</label>
              <input type="text" name="toplength" class="form-control" id="toplength" placeholder="toplength" required>
            </div>
            <div class="col-md-3 form-group">
            <label>Trouser Length</label>
              <input type="text" name="trouserlength" class="form-control" id="trouserlength" placeholder="trouserlength" required>
            </div>
            <div class="col-md-3 form-group">
            <label>Hip</label>
              <input type="text" name="hip" class="form-control" id="hip" placeholder="hip" required>
            </div>
            <div class="col-md-3 form-group">
            <label>Short Sleeve Length</label>
              <input type="text" name="shortsleevelength" class="form-control" id="shortsleevelength" placeholder="shortsleevelength" required>
            </div>
            <div class="col-md-3 form-group">
            <label>Long Sleeve Length</label>
              <input type="text" name="longsleevelength" class="form-control" id="longsleevelength" placeholder="longsleevelength" required>
            </div>
            <div class="col-md-3 form-group">
            <label>Email</label>
              <input type="email" name="email" class="form-control" id="email" value=${email } required>
            </div>
           
          </div>
          <br>
       <div class="text-center"><button type="submit" class="btn-get-started">Add Order</button></div>
        </form><br><br><br><br>
              </div>
            </div>
          </div>
          
           
          	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
                
                
           
                </div>
      </div>
    </div><!-- End Team Section -->
 
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