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

<style type="text/css">

	#img{

		max-height: 375px; 
		width: 100%; 
		height: 100%; 
		object-fit: contain;
		margin-left: auto; 
		margin-right: auto; 
		display: block;
	}

	
</style>

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
<link href="./resources/css/photoDetails.css" rel="stylesheet">

</head>



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

	$(function() {
		//글자수 제한 수정해야 함. 
		
		$('#the_text').keyup(function() {
		    
			  var characterCount = $(this).val().length,
			      current = $('#current_text'),
			      maximum = $('#maximum'),
			      theCount = $('#the-count');
			    
			  current.text(characterCount);
			 
			  
			  /*This isn't entirely necessary, just playin around*/
			  if (characterCount < 70) {
			    current.css('color', '#666');
			  }
			  if (characterCount > 70 && characterCount < 90) {
			    current.css('color', '#6d5555');
			  }
			  if (characterCount > 90 && characterCount < 100) {
			    current.css('color', '#793535');
			  }
			  if (characterCount > 100 && characterCount < 120) {
			    current.css('color', '#841c1c');
			  }
			  if (characterCount > 120 && characterCount < 139) {
			    current.css('color', '#8f0001');
			  }
			  
			  if (characterCount >= 140) {
			    maximum.css('color', '#8f0001');
			    current.css('color', '#8f0001');
			    theCount.css('font-weight','bold');
			  } else {
			    maximum.css('color','#666');
			    theCount.css('font-weight','normal');
			  }
			  
			      
			});

		
		$('#the_textarea').keyup(function() {
		    
			  var characterCount = $(this).val().length,
			      current = $('#current_textarea'),
			      maximum = $('#maximum'),
			      theCount = $('#the-count');
			    
			  current.text(characterCount);
			 
			  
			  /*This isn't entirely necessary, just playin around*/
			  if (characterCount < 70) {
			    current.css('color', '#666');
			  }
			  if (characterCount > 70 && characterCount < 90) {
			    current.css('color', '#6d5555');
			  }
			  if (characterCount > 90 && characterCount < 100) {
			    current.css('color', '#793535');
			  }
			  if (characterCount > 100 && characterCount < 120) {
			    current.css('color', '#841c1c');
			  }
			  if (characterCount > 120 && characterCount < 139) {
			    current.css('color', '#8f0001');
			  }
			  
			  if (characterCount >= 140) {
			    maximum.css('color', '#8f0001');
			    current.css('color', '#8f0001');
			    theCount.css('font-weight','bold');
			  } else {
			    maximum.css('color','#666');
			    theCount.css('font-weight','normal');
			  }
			  
			      
			});
	});
	
	
	
	var map;
	var markers = [];
	var geocoder;
	var getlat = parseFloat("${photo.lat}");
	var getlng = parseFloat("${photo.lng}");
	
	function initMap() {
		
		geocoder = new google.maps.Geocoder();
		infowindow = new google.maps.InfoWindow;
		
		if(!isNaN(getlat) && !isNaN(getlng)){
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : getlat,
					lng : getlng
				},
				zoom : 8
			});
			
			var latlng = {lat: getlat, lng: getlng};
			geocoder.geocode({'location': latlng}, function(results, status) {
	 	        if (status == google.maps.GeocoderStatus.OK) {
	 	            map.setCenter(results[0].geometry.location);
	 	            var marker = new google.maps.Marker({
	 	               position: latlng,
	 	               map: map
	 	            });
	 	 
	 	           infowindow.setContent(
	                		'<div class="wrap">' 
	                		+ '   <div class="info">'
	                		+ '		<div class="title"><strong>' + '${photo.landmark}' + '</strong></div><br>'
	                		+ '        <div class="body">'
	                		+ '            <div class="desc">' 
	                		+ '					<div class="ellipsis"><strong>주소: </strong>' + results[0].formatted_address +'</div>'
	    					+ '					<div class="jibun ellipsis"><strong>위치정보: </strong>' + getlat + ", " + getlng + '</div><br>'
	    					+ '            </div>'
	    					+ '        </div>'
	    					+ '   </div>'
	    					+ '</div>')
	    					
	                infowindow.open(map, marker);
	 	        } 
	 	    });
			
		}
		else{
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : -34.397,
					lng : 150.644
				},
				zoom : 8
			});
		}
		 
	}
</script>

<style>
	textarea{
		border: 1px solid black;
	}
</style>

</head>

<body id="page-top">

		<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
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

	<form action="createAlbum" method="POST" enctype="multipart/form-data">
		<section class="content-section" id="portfolio">
			<div class="container">
				<div class="content-section-heading text-center">
					<h3 class="text-secondary mb-0">My Journey Diary</h3>
					<h2 class="mb-5">View Photo</h2>
				</div>

				<div class="form-group">
					<div class="wrapper">					
						<img id="img" src="${Photosrc}${photo.photoimg}"/>
					</div>
				</div>
				
				<div class="form-group">
				<c:if test="${photo.privacy eq 'public'}">
					<div class="wrapper">
						<input class="privacy" type="radio" name="privacy" value="public" checked="checked">공개 
						<input class="privacy" type="radio" name="privacy" value="private">비공개<br>
					</div>
				</c:if>
				<c:if test="${photo.privacy eq 'private'}">
					<div class="wrapper">
						<input class="privacy" type="radio" name="privacy" value="public">공개 
						<input class="privacy" type="radio" name="privacy" value="private" checked="checked">비공개<br>
					</div>
				</c:if>
				</div>
				
				<div class="form-group">
					<div class="wrapper">
						<h4>Photo Content</h4>
						<textarea id="the_textarea" name="photocontent"  style="resize: none" readonly="readonly">${photo.photocontent}</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="wrapper">
						<h4>Hashtag</h4>
						<a href="#">${photo.hashtag}</a>
					</div>
				</div>
				
				<div class="form-group">
					<div class="wrapper">
						<h4>Date of Travel</h4>
						<input type="date" class="form-control" name="startdate" value="${photo.dateoftravel}" readonly="readonly"/>
					</div>
				</div>
				
				<c:if test="${photo.lat != null}">
					<div class="wrapper" style="align: center;">
						<div id="map" style="width: auto; height: 350px; display: block;">Location</div>
					</div>
					<input id="pac-input" class="controls" type="hidden">
					<div id="infowindow-content"></div>
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
				</c:if>
				
				<form id="insertPosition" action="insertPosition" method="POST">
					<input id="insertPos" type="hidden" name="photono">
				</form>
				<form id="updatePhoto" action="updatePhoto" method="POST">
					<input id="updateNo" type="hidden" name="photono">
				</form>
				<form id="deletePhoto" action="deletePhoto" method="POST">
					<input id="deleteNo" type="hidden" name="photono">
				</form>
				<div class="wrapper">
					<div>
				<%-- <input type="button" value="위치정보추가" onclick="insertPosition(${photo.photono})"> --%>
						<input class="btn" type="button" value="ALTER" onclick="updatePhoto(${photo.photono})">
						<input class="btn" type="button" value="DELETE" onclick="deletePhoto(${photo.photono})">
					</div>
				</div>	
			</div>
		</section>

<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

<!-- Call to Action -->
		<section class="content-section bg-primary text-white">
			<div id="bottomnav" class="container text-center">
				<button type="submit" class="btn btn-primary">CONFIRM</button>
			</div>
		</section>


	</form>



	<!— Bootstrap core JavaScript —>
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!— Plugin JavaScript —>
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!— Custom scripts for this template —>
	<script src="./resources/js/stylish-portfolio.min.js"></script>

</body>

</html>