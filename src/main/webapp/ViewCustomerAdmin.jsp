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
      <button onclick="history.back()" ><b>Back</b></button>
        <h1><a href="index.html"><span>Tailoring</span>System</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="">Home</a></li>
          <li><a class="nav-link scrollto" href="ViewAppointments.jsp">ViewAppointments</a></li>
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
 <!-- ======= Contact Section ======= -->
    <div id="pricing" class="pricing-area area-padding">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>View Customer</h2>
            </div>
          </div>
         
       <!-- <div class="col-lg-3"> -->
   <div class="col-md-3 col-sm-3 col-xs-12">
            <div class="pri_table_list">
          
       <a href="AddWomensClothingStyle.jsp" style="width:230px;background-color:#d53e68;" class="btn-get-started scrollto animate__animated animate__fadeInUp">Add Women's Style</a><br>
        <a href="AddFabric.jsp" style="width:230px;background-color:#d53e68;" class="btn-get-started scrollto animate__animated animate__fadeInUp">Add Fabric</a><br>  
       <a href="ViewOrderAdmin.jsp" style="width:230px;background-color:#d53e68;" class="btn-get-started scrollto animate__animated animate__fadeInUp">View Orders</a>
       <br>
       <a href="ViewCustomerAdmin.jsp" style="width:230px; background-color:#d53e68;" class="btn-get-started scrollto animate__animated animate__fadeInUp">View Customer</a><br>
       <a href="ViewTailorAdmin.jsp" style="width:230px; background-color:#d53e68;" class="btn-get-started scrollto animate__animated animate__fadeInUp">View Tailor</a><br>
         </div>
       </div>
      <div class="col-md-9 col-sm-9 col-xs-12">
            <div class="pri_table_list">
            
             <form class="subscription-form">
                
                    <table class="table table-bordered" style="color:black">
                   
                     <%
                     Connection con=DBConnection.getConnection();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from user");
                     //while(rs.next())
                     if(rs.next() == false) {
                    	%>
                    	<h4 style="text-align:right;margin-right:70px"><b>No Users Present</b></h4>
                    	<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
                    	 <tr  class="danger" style="color:black">
		                    
		                    <th> Customer Name</th>
		                     <th>Customer Address</th>
		                     <th>Email</th>
		                     <th>Mobile No</th>
		                    
		                      <th>Action</th> 
		                  </tr>
		                  <%}%>
                    	 <TR>
                    	<%-- <td><img alt="Profile Pic" class="img-circle" src="Profilepic.jsp?id=<%=rs.getInt(1) %>"  width="100px" height="80px"/></td>
                    	   --%>
                    	  <td style="color:black"><%=rs.getString(2) %></td>
                    	  <td style="color:black"><%=rs.getString(3) %></td> 
                    	 <td style="color:black"><%=rs.getString(4) %></td>
                    	 <td style="color:black"><%=rs.getString(5) %></td>
                    	 <td><a style="color:red;" href="DeleteUserCon?id=<%=rs.getInt(1)%>"><b>Delete</b></a></td>
                    	 </TR>                    	 
                    <%count++; }while(rs.next());}%> 
                   
                    </table>     
                  </form>
            
       </div>
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