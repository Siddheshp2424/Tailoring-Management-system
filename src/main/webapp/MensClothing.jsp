<!DOCTYPE html>
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
              <h2>Trending Men's Styles</h2>
            </div>
          </div>
        </div>
        <div class="row wesome-project-1 fix">
          <!-- Start Portfolio -page -->
          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All Styles</li>
              <li data-filter=".filter-app">Ethic Wear</li>
              <li data-filter=".filter-card">Formal Wear</li>
             
            </ul>
          </div>
        </div>

        <div class="row awesome-project-content portfolio-container">

         

 <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="AddFabricDetails.jsp"><img src="assets/img/pathanisuit.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                   
                      <h4>
                      <form action="AddDressTypeCon" method="post">
                      <div class="form-group mt-1">
              <input type="text" name="clothtype" class="form-control" id="clothtype" value="Pathani Suit" readonly>
            </div>
            <div class="form-group mt-1">
              <input type="text" name="price" class="form-control" id="price" value="2000" readonly>
            </div>
           
                      </h4>
                      
                      
                      <button class="btn-get-started" type="submit">Choose</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div> 

          <!-- portfolio-item start -->
            <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/kurtapajama.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    
                      <h4>Kurta Pyjama</h4>
                      <span>1000</span>
                      <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

          <!-- portfolio-item start -->
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app portfolio-item">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/shervani1.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    
                      <h4>Sherwani</h4>
                      <span>1500</span>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

          <!-- portfolio-item start -->
         <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/shirt.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    
                      <h4>Shirt</h4>
                      <span>700</span>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

          <!-- portfolio-item start -->
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-app">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/shortkurta.jpg" alt="" /></a>
                <div class="add-actions text-center text-center">
                  <div class="project-dec">
                    
                      <h4>Short Kurta</h4>
                      <span>500</span>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

          <!-- portfolio-item start -->
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/suit.jpg" alt=""/></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                   
                      <h4>Suit</h4>
                      <span>3000</span>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

<div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/Trouser1.jpg" alt=""/></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                   
                      <h4>Trouser</h4>
                      <span>1200</span>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

          <!-- portfolio-item start -->
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/waistcoat.jpg" alt="" /></a>
                <div class="add-actions text-center text-center">
                  <div class="project-dec">
                   
                      <h4>Waistcoat</h4>
                      <span>1500</span>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->

          <!-- portfolio-item start -->
          <div class="col-md-4 col-sm-4 col-xs-12 portfolio-item filter-card">
            <div class="single-awesome-project">
              <div class="awesome-img">
                <a href="#"><img src="assets/img/Jacket.jpg" alt="" /></a>
                <div class="add-actions text-center">
                  <div class="project-dec">
                    
                      <h4>Jacket</h4>
                      <span>900</span>
                      <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button></a>
                       <a href="AddMeasurements.jsp">
                      <button class="btn-get-started">Choose</button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- portfolio-item end -->
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