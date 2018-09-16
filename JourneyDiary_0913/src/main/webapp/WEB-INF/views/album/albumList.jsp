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

<title>Journey Diary</title>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="./resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="./resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./resources/css/albumList.css" rel="stylesheet">

</head>

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
        	</c:if>
			<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="search">Search</a>
			</li>
		</ul>
	</nav>
   
    <!-- Portfolio -->
    <section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h3 class="text-secondary mb-0">My Journey Diary</h3>
          <h2 class="mb-5">Album List</h2>
        </div>
        <div class="row no-gutters">
				<c:forEach var="Album" items="${albumList}">
					<div class="col-lg-6">
						<a class="portfolio-item" href="photoList?albumno=${Album.albumno}"> 
						<span class="caption"> 
								<span class="caption-content">
									<h2>${Album.albumtitle}</h2>
									<p class="mb-0">${Album.albumintro}</p>
								</span>
						</span> 
						
						<img class="img-fluid" src='${albumsrc}${Album.albumimg}' style="width: 560px; height: 420px; overflow: hidden; object-fit: cover;" alt="">
						</a>
					</div>
				</c:forEach>
			</div>
      </div>
    </section>
    
<!-- Call to Action -->
		<section class="content-section bg-primary text-white">
			<div id="bottomnav" class="container text-center">
				<button type="submit" class="btn btn-primary">CONFIRM</button>
			</div>
		</section>



    	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="createAlbum">
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
