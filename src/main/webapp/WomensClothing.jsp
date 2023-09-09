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


<br><br><br><br><br><br>

 <section id="pricing" class="pricing">
      <div class="container">

        <div class="section-title" data-aos="zoom-in">
        
          <h3> <span></span></h3>
          <p></p>
        </div>

        <div class="row">
        <%
                try{
                	
                
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from adddesignbytailor");  
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    while(rs.next()) {
                   	%>
                   	
                  <div class="col-lg-4">
                   	
            <div class="box recommended" data-aos="zoom-in" data-aos-delay="100">
              <!-- <span class="recommended-badge"> -->
                        </button></span>
                     
             <%--  <h3><%=rs.getString(4) %></h3> --%>
             
              <h4><td><img alt="Profile Pic" src="NewClothPic.jsp?id=<%=rs.getInt(1) %>"  width="150px" height="150px"/></td>
                    	 </h4>
              Name: <%=rs.getString(4) %><br>
              Price: <%=rs.getString(5) %><br>             
            
              <div class="btn-wrap">
           <button style="background-color:green;"><a style="color:white;" href="AddFOrder.jsp?designname=<%=rs.getString(4)%>">
               Choose</a></button>
             <%--   <button style="background-color:green;"><a style="color:white;" href="demovirtualtrail.jsp?designname=<%=rs.getString(4)%>">
               Try Now</a></button> --%>
                <!--  <a class="btn-buy" href="ProductView.jsp">View</a> -->
              </div>
            </div>
          </div>
          
          <%-- <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
            <div class="box recommended"" data-aos="zoom-in" data-aos-delay="200">
            <span class="recommended-badge">Recommended</span>
              <h3><%=rs.getString(4) %></h3> 
             <h4><td><img alt="Profile Pic" src="Profilpic1.jsp?id=<%=rs.getInt(1) %>"  width="150px" height="150px"/></td></h4> 
              Price:<%=rs.getString(5) %>   
              <!-- <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li class="na">Pharetra massa</li>
                <li class="na">Massa ultricies mi</li>
              </ul> -->
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Participated</a>
              </div>
            </div>
          </div> --%>
          
         <!--  <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
            <div class="box recommended"" data-aos="zoom-in" data-aos-delay="200">
            <span class="recommended-badge">Recommended</span>
              <h3>Developer</h3>
              <h4><sup>$</sup>29<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li>Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div> -->
                   	
                   	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>

          

          


        </div>

      </div>
    </section><!-- End Pricing Section --> 
    <%-- 
 <!-- ======= Team Section ======= -->
    <div id="team" class="our-team-area area-padding">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Trending Women's Styles</h2>
            </div>
          </div>
        </div>
        <div class="row">
        <%
                try{
                	
                
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select * from addwdresswstyle");  
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    while(rs.next()) {
                   	%>
          <div class="col-md-3 col-sm-3 col-xs-12">
            <div class="single-team-member">
              <div class="team-img">
                <a href="#">
                  <!-- <img src="assets/img/team/1.jpg" alt=""> -->
                  <img alt="Profile Pic" src="WomenDressStylePic.jsp?id=<%=rs.getInt(1) %>"/>
                               </a>
                <div class="team-social-icon text-center">
                  <ul>
                    <li style="color:#fff; font-size:20px;">
                   
                      <a href="AddOrderCloth.jsp?dressname=<%=rs.getString(4)%>" style="width:100px; font-size:20px;"><b>Choose</b></a>
                    </li>
                    </ul>
                </div>
              </div>
              <div class="team-content text-center">
               Name: <%=rs.getString(4) %><br>
               Price: <%=rs.getString(5) %>
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
     --%>
    <!-- 
    ======= Portfolio Section =======
    <div id="portfolio" class="portfolio-area area-padding fix">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Trending Women's Styles</h2>
            </div>
          </div>
        </div>
        <div class="row wesome-project-1 fix">
          Start Portfolio -page
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All Styles</li>
              
              <li data-filter=".filter-card">Formal Wear</li>
              <li data-filter=".filter-card1">Western Wear</li>	
              <li data-filter=".filter-app">Ethic Wear</li>
             
            </ul>
          </div>
        </div>

        <div class="row awesome-project-content portfolio-container">

          portfolio-item start
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/salvarkamiz.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/salvarkamiz.jpg" width="300px;">
                      <h4>Salvar Kamiz</h4>
                      <span>1000</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
            <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/blouse.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/blouse.jpg" width="300px;">
                      <h4>Blouse</h4>
                      <span>900</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/lehenga.jpeg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/lehenga.jpeg" ">
                      <h4>Lehenga</h4>
                      <span>2000</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
        <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/Chudidar.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/Chudidar.jpg">
                      <h4>Chudidar</h4>
                      <span>1200</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app1">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/Jackets.jpg" alt="" /></a>
                <div class="add-actions text-center text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/Jackets.jpg">
                      <h4>Jackets</h4>
                      <span>800</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/shirts.jpg" alt=""/></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/shirts.jpg">
                      <h4>Shirts</h4>
                      <span>700</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

<div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card1">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/skirts.jpg" alt=""/></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/skirts.jpg">
                      <h4>Skirts</h4>
                      <span>800</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/Trouser.jpg" alt="" /></a>
                <div class="add-actions text-center text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/Trouser.jpg">
                      <h4>Trousers</h4>
                      <span>1200</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end

          portfolio-item start
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card1">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/dress.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    <a class="portfolio-lightbox" data-gallery="myGallery" href="assets/img/dress.jpg">
                      <h4>Dress</h4>
                      <span>900</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          portfolio-item end
        </div>
      </div>
    </div>End Portfolio Section
 -->
  

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