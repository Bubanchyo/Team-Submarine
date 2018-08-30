<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Grayscale - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="./resources/vendor/vendor1/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="./resources/vendor/vendor1/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./resources/css/grayscale.min.css" rel="stylesheet">
    

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="index">wanderlust</a>
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
          </ul>
          <div>
          	<c:if test="${Member == null}">
          		<a class="nav-link js-scroll-trigger" href="signIn">Sign In</a>
          	</c:if>
          	<c:if test="${Member != null}">
          		<a class="nav-link js-scroll-trigger" href="LogOut">Sign Out</a>
          	</c:if>
          </div>
        </div>
      </div>
    </nav>

   

    <!-- Projects Section -->
    <section id="projects" class="projects-section bg-light">
      <div class="container">

        <!-- Featured Project Row -->
        <div class="row align-items-center no-gutters mb-4 mb-lg-5">
          <div class="col-xl-8 col-lg-7">
            <img class="img-fluid mb-3 mb-lg-0" src="./resources/img/bg-masthead.jpg" alt="">
          </div>
          <div class="col-xl-4 col-lg-5">
            <div class="featured-text text-center text-lg-left">
              <h4>Shoreline</h4>
              <p class="text-black-50 mb-0">Grayscale is open source and MIT licensed. This means you can use it for any project - even commercial projects! Download it, customize it, and publish your website!</p>
            </div>
          </div>
        </div>

        <!-- Project One Row -->
        <div class="row justify-content-center no-gutters mb-5 mb-lg-0">
          <div class="col-lg-6">
            <img class="img-fluid" src="./resources/img/demo-image-01.jpg" alt="">
          </div>
          <div class="col-lg-6">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-left">
                  <h4 class="text-white">Misty</h4>
                  <p class="mb-0 text-white-50">An example of where you can put an image of a project, or anything else, along with a description.</p>
                  <hr class="d-none d-lg-block mb-0 ml-0">
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Project Two Row -->
        <div class="row justify-content-center no-gutters">
          <div class="col-lg-6">
            <img class="img-fluid" src="./resources/img/demo-image-02.jpg" alt="">
          </div>
          <div class="col-lg-6 order-lg-first">
            <div class="bg-black text-center h-100 project">
              <div class="d-flex h-100">
                <div class="project-text w-100 my-auto text-center text-lg-right">
                  <h4 class="text-white">Mountains</h4>
                  <p class="mb-0 text-white-50">Another example of a project with its respective description. These sections work well responsively as well, try this theme on a small screen!</p>
                  <hr class="d-none d-lg-block mb-0 mr-0">
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section>
	
	<div >
		<a href="#" class="btn btn-primary js-scroll-trigger">CREATE</a>		
	</div>
    
    <!-- Footer -->
    <footer class="bg-black small text-center text-white-50">
      <div class="container">
        Copyright &copy; Your Website 2018
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="./resources/vendor/vendor1/jquery/jquery.min.js"></script>
    <script src="./resources/vendor/vendor1/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="./resources/vendor/vendor1/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="./resources/js/grayscale.min.js"></script>

  </body>

</html>
