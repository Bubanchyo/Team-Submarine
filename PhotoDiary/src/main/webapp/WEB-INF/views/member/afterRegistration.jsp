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
    <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
   

    <!-- Custom styles for this template -->
    <link href="./resources/css/grayscale.min.css" rel="stylesheet">
    <link href="./resources/css/regstration.css?ver=2" rel="stylesheet">
    
  	<style>
  		span#emailCheck {
  			color : red;
  		};
  	</style>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    
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
    	    				  	  $("#emailCheck").text("이미 가입된 이메일 주소입니다.");
    	    	
    	    				  } else {
    	    					  $("#emailCheck").text("사용 가능한 이메일 주소입니다.");
    	    			
    	    				  }
    	    			   }
    			});
    		});
			
    		
    		
    		$("#registerBtn").on('click', function(){
    			var usernameL = $('#username').val().length;
    			if(usernameL == 0){
    				alert("이름을 입력해주세요.");
    			}
    			
    			if(usernameL < 3 || usernameL > 10){
    				alert("이름을 3~10자 사이의 크기로 입력해주세요.");
    			}
    			
    			
    			var userpwd1 = $("#userPassword").val();
    			var userpwd2 = $("#confirmUserpassword").val();
    			if(userpwd1 !== userpwd2){ 
    				alert("비밀번호가 서로 일치하지 않습니다.");
    				$("#confirmUserpassword").val("");
    				$("#userPassword").val("").focus();
    				
    				return false;
    			}else if(userpwd1.length < 8){
    				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
    				$("#confirmUserpassword").val("");
    				$("#userPassword").val("").focus();
    				
    				return false;
    			}else if($.trim($("#username").val()) != $("#username").val()
    					|| $.trim($("#useremail").val()) != $("#useremail").val()
    					|| $.trim($("#userPassword").val()) != $("#userPassword").val()
    					|| $.trim($("#confirmUserpassword").val()) != $("#confirmUserpassword").val()){
    				alert("공백은 입력이 불가능합니다.");
    				return false;
    			}
    		
    		}); 
    	});
    		

    </script>
    

  </head>

  <body id="page-top">
  
      <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Start Bootstrap</a>
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


 	<!-- Registration Section -->
 	<section>
	 <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body" align="center">
            <h2 class="card-title text-center">wanderlust</h2>
            <h5>${message}</h5>
            <a href="logIn" class="btn btn-info" role="button">LOG IN</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

    <!-- Bootstrap core JavaScript -->
    <script src="./resources/vendor/jquery/jquery.min.js"></script>
    <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="./resources/js/grayscale.min.js"></script>

  </body>

</html>
