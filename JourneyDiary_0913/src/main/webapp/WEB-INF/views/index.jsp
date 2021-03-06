<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title> Journey Diary</title>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="./resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="./resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./resources/css/index.css" rel="stylesheet">

</head>

<!--  -->
<script>
	$(function(){
		var filter = "win16|win32|win64|mac|macintel";
		if ( navigator.platform ) { 
			if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) 
			{ 
				$('.carousel-item').css('max-height', '200px');
				$('.portfolio-item').css('max-height', '200px');
			}
		}
	});
		
	</script>
<!--  -->


<body id="page-top">

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a class="js-scroll-trigger" href="index">Journey Diary</a>
			</li>
			<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="intro">About</a>
			</li>
			<c:if test="${sessionScope.username == null}">
				<li class="sidebar-nav-item">
					<a class="js-scroll-trigger" href="register">Register</a>
				</li>
				<li class="sidebar-nav-item">
					<a class="js-scroll-trigger" href="logIn">Log In</a>
				</li>
				
			</c:if>
			<c:if test="${sessionScope.username != null}">
        		<li class="sidebar-nav-item">
          			<a class="js-scroll-trigger" href="logout">Log Out</a>
        		</li>
        		<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="showAlbum">My Journey Diary</a>
				</li>
				<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="viewProfile">My Profile</a>
				</li>
        	</c:if>
			<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="search">Search</a>
			</li>
		</ul>
	</nav>	
	<!-- Header -->
	<header class="masthead d-flex">
		<div class="container text-center my-auto" style="padding: 0 0 20px 0">
			<h1 class="mb-1">Journey Diary</h1>
			<br>
			<!-- <h3 class="mb-5">
				<em>A Free Bootstrap Theme by Start Bootstrap</em>
			</h3> -->
			<c:if test="${sessionScope.username == null}">
				<a class="btn btn-primary btn-xl js-scroll-trigger" href="intro">Find
					Out More</a>
			</c:if>
			<c:if test="${sessionScope.username != null}">
				<a class="btn btn-primary btn-xl js-scroll-trigger" href="showAlbum">My
					Journey Diary</a>
			</c:if>
		</div>
		<div class="overlay"></div>
	</header>

	<!-- About -->

	<!-- 
    <section class="content-section bg-light" id="about">
      <div class="container text-center">
        <div class="row">
          <div class="col-lg-10 mx-auto">
            <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
            <p class="lead mb-5">This theme features a flexible, UX friendly sidebar menu and stock photos from our friends at
              <a href="https://unsplash.com/">Unsplash</a>!</p>
            <a class="btn btn-dark btn-xl js-scroll-trigger" href="#services">What We Offer</a>
          </div>
        </div>
      </div>
    </section>
	-->

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <c:forEach var="bestPhoto" items="${bestPhotoList}" varStatus="status">
    	<c:if test="${status.index == 0}">
    		<div class="carousel-item active" style="max-height: 800px; overflow: hidden;">
    			<img class="d-block w-100" src="${Photosrc}${bestPhoto.photoimg}" alt="Best Top 5 Photos" style='object-fit: fill; max-height: 100%;'>
    			<div class="carousel-caption">
          			<h3>${bestPhoto.landmark}</h3>
          			<p>${bestPhoto.photocontent}</p>
        		</div>
    		</div>
    	</c:if>
    	<c:if test="${status.index != 0}">
    	<div class="carousel-item" style="max-height: 800px; overflow: hidden;">
    		<img class="d-block w-100" src="${Photosrc}${bestPhoto.photoimg}" alt="Best Top 5 Photos" style='object-fit: fill; min-height: 100%; max-height: 100%;'>
    			<div class="carousel-caption">
    				<h3>${bestPhoto.landmark}</h3>
          			<p>${bestPhoto.photocontent}</p>
        		</div>
    		</div>
    	</c:if>
    </c:forEach>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">이전</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">다음</span>
  </a>
</div>

	<!-- Services -->
	<section class="content-section bg-primary text-white text-center"
		id="services">
		<div class="container">

			<div class="content-section-heading">
				<h3 class="text-secondary mb-0">Services</h3>
				<h2 class="mb-5">What We Offer</h2>
			</div>

			<div class="row">
				<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> 
					<i class="fas fa-mobile-alt"></i>
					</span>
					<h4>
						<strong>Memorable</strong>
					</h4>
					<p class="text-faded mb-0">Leave the Moment of Traveling Instantly!</p>
				</div>
				
				<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> 
					<i class="fas fa-map-marker-alt"></i>
					</span>
					<h4>
						<strong>Convenient</strong>
					</h4>
					<p class="text-faded mb-0">Get the Location of the Travel Automatically.</p>
				</div>
				<div class="col-lg-3 col-md-6 mb-5 mb-md-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> 
					<i class="fas fa-map-marked-alt"></i>
					</span>
					<h4>
						<strong>abcde</strong>
					</h4>
					<p class="text-faded mb-0">
						Trace Where You Travelled.
					</p>
				</div>
				<div class="col-lg-3 col-md-6">
					<span class="service-icon rounded-circle mx-auto mb-3"> 
						<i class="fas fa-info-circle"></i>
					</span>
					<h4>
						<strong>Informative</strong>
					</h4>
					<p class="text-faded mb-0">Find a lot of Useful Information about traveling</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Callout -->

	<!-- 
    <section class="callout">
      <div class="container text-center">
        <h2 class="mx-auto mb-5">Welcome to
          <em>your</em>
          next website!</h2>
        <a class="btn btn-primary btn-xl" href="https://startbootstrap.com/template-overviews/stylish-portfolio/">Download Now!</a>
      </div>
    </section>
    
    -->

	<!-- Portfolio -->
	<section class="content-section" id="portfolio">
		<div class="container">
			<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">Portfolio</h3>
				<h2 class="mb-5">Recent Projects</h2>
			</div>
			<div class="row no-gutters">
				<c:forEach var="Photo" items="${photoList}">
				<div class="col-lg-6">
						<a class="portfolio-item" href="photoDetails?photono=${Photo.photono}" style='width: 100%; height: 100%; max-height: 300px; max-width: 600px; overflow: hidden;'> 
							<span class="caption">
								<span class="caption-content">
									<h2>Stationary</h2>
									<p class="mb-0">${Photo.photocontent}</p>
								</span>
							</span>
							<img class="img-fluid" src="${Photosrc}${Photo.photoimg}" alt="" style='object-fit: cover; height: 100%; width: 100%; max-width: 100%;'>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Map -->
	<section id="contact" class="map">
		<iframe width="100%" height="100%" frameborder="0" scrolling="no"
			marginheight="0" marginwidth="0"
			src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
		<br /> <small> <a
			href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
		</small>
	</section>

		<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<p class="text-muted small mb-0">Copyright &copy; Your Website
				2018</p>
		</div>
	</footer>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="./resources/js/stylish-portfolio.min.js"></script>

</body>

</html>
