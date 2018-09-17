<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var map;
	var markers = [];
	var geocoder;
	var getlat = parseFloat("${Photo.lat}");
	var getlng = parseFloat("${Photo.lng}");
	
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
			
			geocoder.geocode( { 'address': '${Photo.keyword}'}, function(results, status) {
	 	        if (status == google.maps.GeocoderStatus.OK) {
	 	            map.setCenter(results[0].geometry.location);
	 	            var marker = new google.maps.Marker({
	 	                map: map,
	 	                position: results[0].geometry.location
	 	            });
	 	 
	 	           infowindow.setContent(
	                		'<div class="wrap">' 
	                		+ '   <div class="info">'
	                		+ '		<div class="title"><strong>' + '${Photo.keyword}' + '</strong></div><br>'
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
	
	function deletePhoto(photono){
		$('#photono').attr('value', photono);
		$('#controllPhoto').submit();
		console.log('흰머리');
	}
	
</script>

<body id="page-top">

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a class="js-scroll-trigger" href="index">Start Bootstrap</a>
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
				<a class="js-scroll-trigger" href="#contact">Search</a>
			</li>
		</ul>
	</nav>
<h1>Photos view</h1>

	<div>
		<img id="img" style="width: 500px; height: 375px" src="${Photo.photoimg}"/>
	</div>

	<input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개 
	<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
	<textarea name="photocontent" rows="10" cols="90" style="resize: none">${Photo.photocontent}</textarea>
	<div id="hashtag"><a href="#">${Photo.keyword}</a></div>
	<input type="date" name="dateoftravel" value="${Photo.dateoftravel}"> 

	<c:if test="${Photo.lat != null}">
	<div id="map" style="width: 650px; height: 350px; display: block;">지도</div>
    <input id="pac-input" class="controls" type="hidden">
    <div id="infowindow-content"></div>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
	</c:if>

	<form id="controllPhoto" action="deletePhoto" method="POST">
		<input id="photono" type="hidden" name="photono">
	</form>

</body>
</html>

