<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="ko">

  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Grayscale - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
	<link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
   

    <!-- Custom styles for this template -->

    <link href="./resources/css/register.css" rel="stylesheet">
    <link href="./resources/css/stylish-portfolio.min.css" rel="stylesheet">
    
  	<style>
  		span#emailCheck {
  			color : red;
  		};
  	</style>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
        <script>
    	$(function(){
    		
    		$('#useremail').on('focusout', function(){
    			
    			var useremailL = $('#useremail').val().length;
    			if(useremailL == 0){
    				 $("#emailCheck").text("이메일을 입력해주세요.");
    				 return;
    			}
    			
    			//email주소 유효성 검사 
    			var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    			var useremail = $("#useremail").val();
    			var result = (useremail != '' && useremail != 'undefined' && regex.test(useremail))
    			console.log("useremail유효성 검사 : " + result);
    			if(!result){
    				 $("#emailCheck").text("이메일을 다시 입력해주세요.");
    				 $("#emailCheck").val("").focus();
    				 return;
    			}
    			
 
    			$.ajax({
    				url  : "checkEmail"
    	    	  , type : "POST"
    	   		  , data : {"useremail" : $("#useremail").val()}
     			  , success : function(data){
    	    				  console.log(data);
    	    				  if(data == 1){
    	    				  	  $("#emailCheck").text("올바른 메일 주소입니다. 비밀번호를 입력해주세요.");
    	    	
    	    				  } else {
    	    					  $("#emailCheck").text("이메일 정보가 없습니다.");
    	    			
    	    				  }
    	    			   }
    			});
    		});
			
    		var userpasswordL = $('#userpassword').val().length;
			if(userpasswordL < 8){
				 $("#emailCheck").text("이메일을 입력해주세요.");
				 return;
			}	
    	});
    			
    </script>
    

  </head>


<body>


  <!-- Navigation -->
    <a class="menu-toggle rounded" href="#">
      <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <li class="sidebar-brand">
          <a class="js-scroll-trigger" href="#page-top">Start Bootstrap</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#about">About</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="register">Register</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="logIn">Log In</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#contact">Search</a>
        </li>
      </ul>
    </nav>

<br><br><br>

  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign In</h5>
            <span id="emailCheck"></span>
            <form class="form-signin" action="login" method="post">
              <div class="form-label-group">
                <input type="email" id="useremail" name="useremail" class="form-control" placeholder="Email address" required autofocus>
              </div>

              <div class="form-label-group">
                <input type="password" id="userpassword" name="userpassword"  class="form-control" placeholder="Password" required>   
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" id="loginBtn" type="submit">Sign in</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  
  <!-- Bootstrap core JavaScript -->
    <script src="./resources/vendor/jquery/jquery.min.js"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
	<script src="./resources/js/stylish-portfolio.min.js"></script>
</body>
</html>
