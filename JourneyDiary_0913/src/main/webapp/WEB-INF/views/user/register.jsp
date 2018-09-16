<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="ko">

  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Journey Diary</title>

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
    			
    			
    			var userpwd1 = $("#userpassword").val();
    			var userpwd2 = $("#confirmUserpassword").val();
    			if(userpwd1 !== userpwd2){ 
    				alert("비밀번호가 서로 일치하지 않습니다.");
    				$("#confirmUserpassword").val("");
    				$("#userpassword").val("").focus();
    				
    				return false;
    			}else if(userpwd1.length < 8){
    				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
    				$("#confirmUserpassword").val("");
    				$("#userpassword").val("").focus();
    				
    				return false;
    			}else if($.trim($("#username").val()) != $("#username").val()
    					|| $.trim($("#useremail").val()) != $("#useremail").val()
    					|| $.trim($("#userpassword").val()) != $("#userpassword").val()
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
<br><br><br>

 	<!-- Registration Section -->
 	<section>
	 <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">Register</h5>
            <span id="emailCheck"></span>
            <form action="register" method="POST">
              <div class="form-label-group">
                <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
                
              </div>

              <div class="form-label-group">
                <input type="email" id="useremail" name="useremail" class="form-control" placeholder="Email address" required>
              </div>
              
              <hr>

              <div class="form-label-group">
                <input type="password" id="userpassword" name="userpassword" class="form-control" placeholder="Password" required>
          
              </div>
              
              <div class="form-label-group">
                <input type="password" id="confirmUserpassword" name="confirmUserpassword" class="form-control" placeholder="Password" required>
             
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" id="registerBtn" type="submit">Register</button>
              <a class="d-block text-center mt-2 small" href="logIn">Sign In</a>

            </form>
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
	<script src="./resources/js/stylish-portfolio.min.js"></script>

  </body>

</html>
