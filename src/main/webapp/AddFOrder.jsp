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
  /* Hide the default select element */
.custom-select select {
  display: none;
}

/* Style the custom select */
.custom-select {
  position: relative;
  display: inline-block;
}

.custom-select .select-selected {
  display: flex;
  align-items: center;
  padding: 8px 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
}

.custom-select .select-selected img {
  margin-right: 8px;
  width: 20px;
  height: 20px;
}

.custom-select .select-options {
  display: none;
  position: absolute;
  z-index: 999;
  top: 100%;
  left: 0;
  right: 0;
}

.custom-select .select-option {
  display: flex;
  align-items: center;
  padding: 8px 16px;
  border: 1px solid #ccc;
  border-top: none;
  font-size: 16px;
  cursor: pointer;
}

.custom-select .select-option img {
  margin-right: 8px;
  width: 20px;
  height: 20px;
}

.custom-select.open .select-options {
  display: block;
}
  
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

 
 <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <!-- <div class="section-title">
          <h2>About</h2>
          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
        </div> -->
<%


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
        <div class="row">
          <div class="col-lg-4">
          <td><img alt="Profile Pic" src="NewClothPic.jsp?id=<%=rs.getInt(1) %>"  width="300px" height="300px"/></td>
                   
           <!--  <img src="assets/img/about.jpg" class="img-fluid" alt=""> -->
          </div>
          <div class="col-lg-8 pt-4 pt-lg-0 content">
          
           
            
            <br>
          <!--   </p> -->
            <form action="AddOrderController" method="post" class="formone"> 
            <div class="row">
           
              <div class="col-lg-6">
              
                <ul>
                
                  
                 <li><i class="bi bi-rounded-right"></i> <strong> <label>Dress Name</label></strong>
          <input type="text" name="dressname" class="form-control" id="dressname" value="<%=rs.getString(4) %>" required>
          </li>
          <li><i class="bi bi-rounded-right"></i> <strong><label>Price</label></strong>
            <input type="text" name="price" class="form-control" id="price" value="<%=rs.getString(5) %>" required>
                 </li> 	
          <li><i class="bi bi-rounded-right"></i> <strong>Add Fabric:</strong> 
           <select class="form-control" id="fabricname" size="1" name="fabricname">
<option value="" disabled selected>Select Type</option>                    
                        <option value="Chiffon">Chiffon</option>
                        <option value="Cotton">Cotton</option>
                        <option value="Cotton Linen">Cotton Linen</option>
                        <option value="Cotton Silk">Cotton Silk</option>
                        <option value="Crepe">Crepe</option>
                        <option value="Satin">Satin</option>
                          </select>
                  <!-- <div class="custom-select">
  <div class="select-selected" name="fabric">
    <img src="assets/img/fabric/Chiffon.jpg" alt="Option 1">
    Chiffon
  </div>
  <div class="select-options">
    <div class="select-option">
      <img src="assets/img/fabric/cotton.jpg" alt="Option 1">
      Cotton
    </div>
    <div class="select-option">
      <img src="assets/img/fabric/cottonlinen.jpg" alt="Option 2">
      Cotton Linen
    </div>
    <div class="select-option">
      <img src="assets/img/fabric/cottonsilk.jpg" alt="Option 3">
      Cotton Silk
    </div>
    <div class="select-option">
      <img src="assets/img/fabric/crepe.jpg" alt="Option 3">
      Crepe
    </div>
    <div class="select-option">
      <img src="assets/img/fabric/satin.jpg" alt="Option 3">
      Satin
    </div>
  </div>
</div>
 -->

                  </li>
          
          <!-- 
                  <li><i class="bi bi-rounded-right"></i> <strong>Fabric Name</strong> 
                  <input type="text" name="fabricname" class="form-control" id="fabricname" placeholder="Your name" required>
                  </li> -->
                   <li><i class="bi bi-rounded-right"></i><label>Shoulder</label>
              <input type="text" name="shoulder" class="form-control" id="shoulder" placeholder="shoulder" required>
                  </li>
                   <li><i class="bi bi-rounded-right"></i> <label>Back</label>
              <input type="text" class="form-control" name="back" id="back" placeholder="Back" required>
                  </li>
                   <li><i class="bi bi-rounded-right"></i><label>Arm Hole</label>
              <input type="text" name="armhole" class="form-control" id="armhole" placeholder="armhole" required>
                  </li>
                   <li><i class="bi bi-rounded-right"></i><label>Neck</label>
              <input type="text" name="neck" class="form-control" id="neck" placeholder="neck" required>

                  </li>
                   <li><i class="bi bi-rounded-right"></i><label>Waist</label>
              <input type="text" name="waist" class="form-control" id="waist" placeholder="waist" required>
                  </li>
                  </ul></div>
                  <div class="col-lg-6">
                <ul>
                <li><i class="bi bi-rounded-right"></i><label>Bottom</label>
              <input type="text" name="bottom" class="form-control" id="bottom" placeholder="waist" required>
                  </li>
                   <li><i class="bi bi-rounded-right"></i> <label>Top Length</label>
              <input type="text" name="toplength" class="form-control" id="toplength" placeholder="toplength" required>

                  </li>
                  <li><i class="bi bi-rounded-right"></i><label>Trouser Length</label>
              <input type="text" name="trouserlength" class="form-control" id="trouserlength" placeholder="trouserlength" required>

                  </li>
                  <li><i class="bi bi-rounded-right"></i><label>Hip</label>
              <input type="text" name="hip" class="form-control" id="hip" placeholder="hip" required>

                  </li>
                  <li><i class="bi bi-rounded-right"></i><label>Short Sleeve Length</label>
              <input type="text" name="shortsleevelength" class="form-control" id="shortsleevelength" placeholder="shortsleevelength" required>
            

                  </li>
                   <li><i class="bi bi-rounded-right"></i><label>Long Sleeve Length</label>
              <input type="text" name="longsleevelength" class="form-control" id="longsleevelength" placeholder="longsleevelength" required>
            

                  </li>
                  <li><i class="bi bi-rounded-right"></i><label>Customer Name</label>
              <input type="text" name="name" class="form-control" id="name" value=${name } required>
            </li>
<li><i class="bi bi-rounded-right"></i><label>Tailor Email</label>
              <input type="email" name="email" class="form-control" id="email" value="<%=rs.getString(6) %>" required>
            </li>
           
                </ul>
              </div>
              
           
            </div>
           
            
            <centre><button class="btn-get-started" type="submit" style="background-color:orange;">Submit</button></centre>
          </form>
            
            
              </div>
              
            </div>
           <!--  <p>
              
            </p> -->
             </div>
          
          
        </div>
	<% 
                   	}
                }catch(Exception e)
                {
                	
                	
                }
                %>
                
                
      </div>
    </section><!-- End About Section -->
   
<script type="text/javascript">
//Toggle the dropdown menu
document.querySelector('.custom-select .select-selected').addEventListener('click', function() {
  this.parentElement.classList.toggle('open');
});

// Set the selected option
document.querySelectorAll('.custom-select .select-option').forEach(function(option) {
  option.addEventListener('click', function() {
    this.parentElement.parentElement.querySelector('.select-selected').innerHTML = this.innerHTML;
    this.parentElement.parentElement.querySelector('select').value = this.dataset.value;
    this.parentElement.classList.remove('open');
  });
});

</script>
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