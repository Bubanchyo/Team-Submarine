<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Custom CSS -->

<link href="./resources/css/myProfile.css?ver=3" rel="stylesheet">

<style type="text/css">


	
</style>

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





<script type="text/javascript">
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imagePreview').css('background-image',
					'url(' + e.target.result + ')');
			$('#imagePreview').hide();
			$('#imagePreview').fadeIn(650);
		}
		reader.readAsDataURL(input.files[0]);
		
	}
}
$("#imageUpload").change(function() {
	readURL(this);
});
</script>

</head>

<body>

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#" style="padding: 16px;"> <i class="fas fa-bars"></i>
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
          <h2 class="mb-5">Edit Profile</h2>
        </div>
	<article>
		<div class="avatar-upload">
			<div class="avatar-edit">
				<input type='file' id="imageUpload" name="uploadfile"
					   accept=".png, .jpg, .jpeg" onchange="readURL(this)" value="${Album.albumimg}"/> <label
				       for="imageUpload"
					   style="background-image: url(./resources/img/templates/pencil.png); background-size: 30px 30px; background-repeat: no-repeat; background-position: center;"></label>
					</div>
					<div class="avatar-preview">
						<div id="imagePreview"
							style="background-image: url(${User.userimg});">
						</div>
					</div>
				</div>
		<div class="profile-info">
			<h1>${User.username}</h1>
			<p>${User.useremail}</p>
			<c:if test="${User.gender != null}">
				<p>${User.gender}</p>
			</c:if>
			<a class="btn" href="editProfile">CONFIRM</a>
			<!-- 
			<p>Creative technologist <a href="http://fiascodesign.co.uk/" target="_blank">@FiascoDesign</a>. Maker of web things. Joint owner <a href="http://mountainandco.uk/" target="_blank">@mountainandco</a>.</p>
			 -->
		</div>
		
		<!-- https://www.flaticon.com/packs/monuments-5 -->
		
		
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

<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="./resources/js/stylish-portfolio.min.js"></script>

</html>