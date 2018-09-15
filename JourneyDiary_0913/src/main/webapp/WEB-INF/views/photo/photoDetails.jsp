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
	                		+ '		<div class="title"><strong>' + '${photo.keyword}' + '</strong></div><br>'
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
	
	function insertPosition(photono){
		$('#insertPos').attr('value', photono);
		$('#insertPosition').submit();
	}
	
	function updatePhoto(photono){
		$('#updateNo').attr('value', photono);
		$('#updatePhoto').submit();
	}
	
	function deletePhoto(photono){
		$('#deleteNo').attr('value', photono);
		$('#deletePhoto').submit();
	}
	console.log(('${photo.keyword}'.match(/#/g) || []).length);
</script>

<body>
<h1>photos view</h1>

	<div>
		<img id="img" style="max-width: 500px; max-height: 375px; width: 100%; height: 100%; object-fit: contain;" src="${photo.photoimg}"/>
	</div>

	<input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개 
	<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
	<textarea name="photocontent" rows="10" cols="90" style="resize: none">${photo.photocontent}</textarea>
	<!-- 이곳부터 시작하셔야합니다. 해시태그 자르기를 해야함.... -->
	<div id="hashtag"><a href="#">${photo.keyword}</a></div>
	<input type="date" name="dateoftravel" value="${photo.dateoftravel}"> 

	<c:if test="${photo.lat != null}">
	<div id="map" style="width: 650px; height: 350px; display: block;">지도</div>
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
	
	<%-- <input type="button" value="위치정보추가" onclick="insertPosition(${photo.photono})"> --%>
	<input type="button" value="수정" onclick="updatePhoto(${photo.photono})">
	<input type="button" value="삭제" onclick="deletePhoto(${photo.photono})">

</body>
</html>