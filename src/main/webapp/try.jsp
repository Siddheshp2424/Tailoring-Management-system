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

<link rel="stylesheet" href="Backend/style1.css">
  <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,200&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />

  <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.0.0"></script>
  <script src="https://cdn.jsdelivr.net/npm/@tensorflow-models/body-pix@1.0.0"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/p5.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/addons/p5.dom.min.js"></script>
  <script src="https://unpkg.com/ml5@0.5.0/dist/ml5.min.js"></script>

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
.container{
    position: relative;
    width: 300px;
    height: 300px;
}
.img1{
    position: absolute;
    z-index: 1;
    width: 100%;
    top: 0;
    left: 0;
}
.img2{
    position: absolute;
    z-index: 2;    /* Place this image in front of the img1 */
    width: 100%;
    height: 150%;
    top: 100px;
    left: 33px;
}
</style>
</head>

<body>
<%-- 
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
          <li><a class="nav-link scrollto" href="trailroom.jsp">Trailroom</a></li>
         
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
 --%>
  <br><br>


<body>

   <!-- ======= About Section ======= -->
    <div id="about" class="about-area area-padding" style="background-color:#fff;">
      <div class="container" >
      <!--  <div class="row">
          <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="section-headline text-center">
              <h2>Virtual Trail</h2>
            </div>
          </div>
        </div> 
   -->
  <center>
 <div class="main">
       <div class="col-lg-12">
        <!-- <div class="canvas" id="canvas"> -->
        <%


                try{
                	
                String id=request.getParameter("id");
                	Connection con=DBConnection.getConnection();
                    Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from adddesignbytailor where id='"+id+"'"); 
                  /*  ResultSet rs=st.executeQuery("select * from addnewproduct"); */
                   /*  ResultSet rs=st.executeQuery("select addcategoryauction.id,addcategoryauction.categoryname,addsubcategoryauction.subcategoryname,addsessiondateauction.date,addsessiontimeauction.time,addcategoryauction.status from addcategoryauction inner join addsubcategoryauction on addcategoryauction.cat=addsubcategoryauction.cat inner join addsessiondateauction on addcategoryauction.cat=addsessiondateauction.cat inner join addsessiontimeauction on addcategoryauction.cat=addsessiontimeauction.cat");
                     */
                    //while(rs.next())
                    while(rs.next()) {
                   	%>
          <img class="img1" src='assets/img/model2.jpg'/>
          <img alt="Profile Pic" class="img2" src="NewClothPic.jsp?id=<%=rs.getInt(1) %>" width="150px" height="150px"/>
          <% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
                
         
        </div>
       </div>

</div>
</center></div></div>
<div>
  
 <%--  <div class="small-container">
    <h2 class="title">Designs</h2>
    <div class="row">
     <!--  <div class="col-4">
          <img class="image" src="Backend/img/suit1.jpg" alt=""
        />
        <h4>Navy Black Suit</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-o"></i>
        </div>
        <p>$50.00</p><br>
        <button class="nextbuttoncanvas" id="" onclick="TrailButton(1)">TRY</button>
      </div>

      <div class="col-4">
        <img src="Backend/img/shirt2.jpg" class="image" alt="" />
        <h4>Blue casual Shirt</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
          <i class="fa fa-star-o"></i>
        </div>
        <p>$50.00</p>
        <br>
        <button class="nextbuttoncanvas"id="" onclick="TrailButton(2)">TRY</button>
      </div>

      <div class="col-4">
        <img class="image" src="Backend/img/shirt8.jpg" alt=""
      />
      <h4>Red shirt</h4>
      <div class="rating">
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star-o"></i>
      </div>
      <p>$50.00</p><br>
      <button class="nextbuttoncanvas" id="" onclick="TrailButton(10)">TRY</button>
      </div>


      <div class="col-4">
        <img src="Backend/img/pant8.jpg" class="image" alt="" />
        <h4>Blue Cargo Pant</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-o"></i>
        </div>
        <p>$50.00</p><br>
        <button class="nextbuttoncanvas" id="" onclick="TrailButton(4)">TRY</button>
      </div> -->
      
     
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
                   	<div class="col-4">
        <img src="NewClothPic.jsp?id=<%=rs.getInt(1) %>" class="image" alt="" width="150px" height="150px"/>
        <h4><%=rs.getString(4) %></h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-o"></i>
        </div>
        <p><%=rs.getString(5) %></p><br>
        <!-- <button class="nextbuttoncanvas" id="" onclick="TrailButton(6)">TRY</button> -->
        <button class="nextbuttoncanvas" id="try.jsp" >TRY</button>
      </div>
                   	    
<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
 
     <!--  <div class="col-4">
        <img src="assets/img/shirt.png" class="image" alt="" />
        <h4>Dress</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-o"></i>
        </div>
        <p>$50.00</p><br>
        <button class="nextbuttoncanvas" id="" onclick="TrailButton(6)">TRY</button>
      </div> -->

   <!--    <div class="col-4">
        <img class="image" src="Backend/img/pant6.jpeg" alt=""
      />
      <h4>Gray Short Pant</h4>
      <div class="rating">
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star-o"></i>
      </div>
      <p>$50.00</p><br>
      <button class="nextbuttoncanvas" id="" onclick="TrailButton(8)">TRY</button>
    </div>
    
    <div class="col-4">
      <img class="image" src="Backend/img/shirt4.jpg" alt=""
    />
    <h4>Blue Printed T-shirt</h4>
    <div class="rating">
      <i class="fa fa-star"></i>
      <i class="fa fa-star"></i>
      <i class="fa fa-star"></i>
      <i class="fa fa-star"></i>
      <i class="fa fa-star-o"></i>
    </div>
    <p>$50.00</p><br>
    <button class="nextbuttoncanvas" id="" onclick="TrailButton(9)">TRY</button>
  </div>
  
      <div class="col-4">
        <img class="image" src="Backend/img/pant7.jpg" alt=""
      />
      <h4>Red short pantt</h4>
      <div class="rating">
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star"></i>
        <i class="fa fa-star-o"></i>
      </div>
      <p>$50.00</p><br>
      <button class="nextbuttoncanvas" id="" onclick="TrailButton(11)">TRY</button>
      </div>

      
      <div class="col-4">
        <img src="Backend/img/watch1.jpg" class="image" alt="" />
        <h4>Black Watch</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
        </div>
        <p>$50.00</p><br>
        <button class="nextbuttoncanvas" id="" onclick="TrailButton(3)">TRY</button>
      </div>

      
      <div class="col-4">
        <img src="Backend/img/sunglass.jpg" class="image" alt="" />
        <h4>Black sunglass</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
        </div>
        <p>$50.00</p><br>
        <button class="nextbuttoncanvas" id="" onclick="TrailButton(12)">TRY</button>
      </div>

      <div class="col-4">
        <img src="Backend/img/shirt.jpg" class="image" alt="" />
        <h4>Blue Shirtt</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-o"></i>
        </div>
        <p>$50.00</p><br>
        <button class="nextbuttoncanvas" id="" onclick="TrailButton(5)">TRY</button>
      </div>  -->


    </div>
 --%>    </div>
    


</div>





  <!-- <img id='person' src='img/person1.jpg'/>
  <img class="first" src="img/1.png"/>
  <img class="second" src="img/2.png"/>
  <img class="third" src="img/3.png"/>
  <img class="fourth" src="img/4.png"/>
  <div id="box1"></div>
  <div id="box2"></div>
  <div id="box3"></div>
  <div id="box4"></div> -->
  <script src="Backend/bodyPix.js" type="text/javascript"></script>
 <!--  <script src="Backend/styleTransfer.js" type="text/javascript"></script> -->

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
