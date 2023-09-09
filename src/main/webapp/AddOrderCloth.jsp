<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
        <h1><a href="index.html"><span>Tailoring</span> System</a></h1>
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
              <h2>Select Fabric</h2>
            </div>
          </div>
        </div>
        <div class="row">
        <%


                try{
                	
                String dressname=request.getParameter("dressname");
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from addwdresswstyle where dressname='"+dressname+"'"); 
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    	
                    	
                    while(rs.next()) {
                   	%>
          <div class="col-md-12 col-sm-12	 col-xs-12">
            <div class="single-team-member">
              <div class="team-img" style="font-size:20px;">
              <form action="AddOrderClothController" method="post" class="formone">
              <div class="row">
              <div class="form-group mt-1">
              <label>Dress Name</label>
              <input type="text" name="dressname" class="form-control" id="dressname" value="<%=rs.getString(4) %>" readonly>           
            </div>
             <div class="form-group mt-1">
            <label>Price</label>
              <input type="text" name="price" class="form-control" id="price" value="<%=rs.getString(5) %>" readonly>           
            </div>
            <div class="form-group mt-1">
              <input type="email" name="email" class="form-control" id="email" value="${email }" readonly>           
            </div>
            <div class="form-group mt-1">
            <button class="btn-get-started" type="submit">Add</button>
            </div>
            </div>
               <%-- Dress Name:- <%=rs.getString(4) %><br>
               Price:- <%=rs.getString(5) %><br> --%>
               Choose Fabric:
              
               
               </form>
              </div>
            </div>
          </div>
          
           
          	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
                
                
                <%
                try{
                	
                
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from addfabric");  
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    while(rs.next()) {
                   	%>
          <div class="col-md-2 col-sm-2 col-xs-12">
            <div class="single-team-member">
              <div class="team-img">
                <a href="#">
                  <!-- <img src="assets/img/team/1.jpg" alt=""> -->
                  <img alt="Profile Pic" src="AddFabricPic.jsp?id=<%=rs.getInt(1) %>"/>
                               </a>
                <div class="team-social-icon text-center">
                  <ul>
                    <li style="color:#fff; font-size:20px;">
                   
                      
                    </li>
                    </ul>
                </div>
              </div>
              <div class="team-content text-center">
               Fabric Name: <%=rs.getString(4) %><br>
               <a class="btn-get-started" href="AddMeasurement.jsp?fabricname=<%=rs.getString(4)%>" type="submit"><b>Choose</b></a>
                    
            
              </div>
            </div>
          </div>
          
          	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
                
                
                </form>
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