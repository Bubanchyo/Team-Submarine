<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Journey Diary</title>

    <!-- Bootstrap core CSS -->
    <link href="./resources/vendor/vendor1/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="./resources/vendor/vendor2/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./resources/css/grayscale.min.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	 <!-- Bootstrap Core CSS -->
    <link href="./resources/vendor/vendor1/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./resources/vendor/vendor2/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="./resources/vendor/vendor2/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./resources/css/stylish-portfolio.min.css" rel="stylesheet">
    <style type="text/css">
    	#nav-bottom{
    		position:fixed; 
    		width:100%;
    		bottom: 0;
    		height:70px;
    		background-color: #f3f3f3; 
    	}
    </style>

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">wanderlust</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#projects">Projects</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#signup">Contact</a>
            </li>
             <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="register">Register</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="logIn">Log In</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    

   <!-- Portfolio -->
    <section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h3 class="text-secondary mb-0">PHOTO LIST</h3>
          <h2 class="mb-5">ALBUM TITLE(나중에 albumno랑 조인해서 album title 받아와야함...)</h2>
        </div>
        <div class="row no-gutters">
          <c:forEach var="Photo" items="${photoList}">
          <div class="col-lg-6">
          	<p>${Photo.photono} || ${Photo.photocontent} || ${Photo.keyword} || ${Photo.photoimg}</p>
            <a class="portfolio-item" href="photoDetails?photono=${Photo.photono}">
              <span class="caption">
                <span class="caption-content">
                  <h2>${Photo.photocontent}</h2>
                  <p class="mb-0">${Photo.keyword}</p>
                </span>
              </span>
              <img class="img-fluid" src="${Photo.photoimg}" alt="">
            </a>
          </div>
          </c:forEach>
        </div>
      </div>
    </section>
 
 	<section>
	<div id="nav-bottom">
		<a href="createPost?albumno=${albumno}" class="btn btn-primary js-scroll-trigger" >CREATE POST</a>
	</div>
</section>

   



    <!-- Bootstrap core JavaScript -->
    <script src="./resources/vendor/vendor1/jquery/jquery.min.js"></script>
    <script src="./resources/vendor/vendor1/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="./resources/vendor/vendor1/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="./resources/js/grayscale.min.js"></script>

  </body>

</html>
