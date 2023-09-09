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


#about .btn-get-started {
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
.about .canvas{
display:none;
}
a{
padding:10px;
bacground-color:orange;
color:white;
text-decoration:none;
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
          
          <!-- <li><a class="nav-link scrollto" href="MensClothing.jsp">Men</a></li> -->
              <li><a class="nav-link scrollto active" href="UserHome.jsp">Home</a></li>
          <li><a class="nav-link scrollto" href="WomensClothing.jsp">Women</a></li>
         
           <li class="dropdown"><a href="#"> View<i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a class="nav-link scrollto" href="ViewOrderUser.jsp">View Orders</a></li>
         <li><a class="nav-link scrollto" href="ViewOrderCloth.jsp">View Order Cloth</a></li>
         <li><a class="nav-link scrollto" href="addorderfabric.jsp">View Added Fabric</a></li>
                    
            </ul>
          </li>         
         <li><a class="nav-link scrollto" href="BookAnAppointment.jsp">Appointment</a></li>
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
 
     <!-- ======= About Section ======= -->
    <div id="about" class="about-area area-padding" style="background-color:#F6B6F7; height:95%;">
      <div class="container" >
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Camera</h2>
            </div>
          </div>
        </div>
       <div class="row">
      <div class="col-lg-6">
      
      <video id="webCam" autoplay playsinlne width="600" height="400"></video>
      <canvas id="canvas"></canvas>
     </div>
     <div class="col-lg-6">
      <a class="btn-get-started" download onClick="takeAPicture()">SNAP</a>
      
    <%--   <%


                try{
                	
                String designname=request.getParameter("designname");
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from adddesignbytailor where designname='"+designname+"'"); 
                  /*  ResultSet rs=st.executeQuery("select * from addnewproduct"); */
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    while(rs.next()) {
                   	%>
                   	<td><img alt="Profile Pic" src="NewClothPic.jsp?id=<%=rs.getInt(1) %>"  width="200px" height="200px"/></td>
            <% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %> --%>
                <!-- <label><b>=</b></label> -->
  </div>
  </div>
       </div>     
       </div>
        
  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  
  <script type="text/javascript" src="https://unpkg.com/webcam-easy/dist/webcam-easy.min.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
 <script type="text/javascript">
  const webCamElement = document.getElementById("webCam");
  const canvasElement = document.getElementById("canvas");
  const webcam = new Webcam(webCamElement,"user",canvasElement);
  webcam.start();
  
  function takeAPicture(){
	let picture = webcam.snap();
	document.querySelector("a").href=picture;
  }
  
  </script>
  
</body>

</html>