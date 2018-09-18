<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Custom CSS -->

<link href="./resources/css/myProfile.css" rel="stylesheet">



</head>

<style>
a {
  color: #1D809F;
}

a:hover, a:focus, a:active {
  color: #155d74;
}
#profile-photo {
	background-image: url("../img/templates/default.png");
}
</style>

<body>

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
	
	
<div class="pfl-wrapper">
		<div class="content-section-heading text-center" style="text-align: center;">
          <h2 class="mb-5">My Profile</h2>
        </div>
	<article>
		<div class="profile-photo"></div>
		<div class="profile-info">
			<h1>${User.username}</h1>
			<p>${User.useremail}</p>
			<c:if test="${User.gender != null}">
				<p>${User.gender}</p>
			</c:if>
			<a class="btn" href="editProfile">EDIT PROFILE</a>
			<!-- <p>Creative technologist <a href="http://fiascodesign.co.uk/" target="_blank">@FiascoDesign</a>. Maker of web things. Joint owner <a href="http://mountainandco.uk/" target="_blank">@mountainandco</a>.</p> --> 
		</div>		
		<div class="row" id="stamp-section">
		<h2 class="mb-5" style="text-align: center;">Stamps of Landmarks</h2>
		<div class="col-xs-12">
				<div class="roundal"  style="text-align: center;">
					<img src="./resources/img/stamp/big-ben.png" style="width: 50px; height: 50px; ">
					<h4>Big Ben</h4>
				</div>
				<div class="roundal"  style="text-align: center;">
					<img src="./resources/img/stamp/eiffel-tower.png" style="width: 50px; height: 50px;">
					<h4>Eiffel Tower</h4>
				</div>
				<div class="roundal"  style="text-align: center;">
					<img src="./resources/img/stamp/leaning-tower-of-pisa.png" style="width: 50px; height: 50px;">
					<h4>Leaning Tower of Pisa</h4>
				</div>			
			</div>
		</div>
	</article>
</div>
</body>
</html>

