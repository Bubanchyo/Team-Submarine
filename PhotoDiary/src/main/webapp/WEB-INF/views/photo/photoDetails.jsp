<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	var getlat = ${photoDetail.lat};
	var getlng = ${photoDetail.lng}
	
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				if(getlat != null && getlng != null){
					lat : getlat,
					lng : getlng
				}else{
					lat : -34.397,
					lng : 150.644
				}
			},
			zoom : 8
		});
	}
</script>

<script>
var markers = [];
var geocoder;
var labelName='';



 function uploadFile(){
                
                            	$.ajax({
                            		url:"hashtag",
                                    data: 'saveFileName='+savedata,
                                    type: 'POST',
                                    success: function(hashtag){
                                    	$("#hashtag").html('<a href="#">#' + hashtag + '</a>');
                                    	$("#hiddenhash").attr('value', hashtag);
                                    	
                                    	getPhotoInfo();
                                    	labelName = hashtag;
                                    }
                            	})
                            }

                
                function getPhotoInfo(resp) {
				

			$("#upResult2").html(text);
			$("#callMap").click(mapinfo);	

		}

		function mapinfo() {
			var map;
			var marker;
			var infowindow;
			var geocoder;

			initMap(labelName);
		}

		function initMap(labelName) {
			geocoder = new google.maps.Geocoder();
			infowindow = new google.maps.InfoWindow;
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : -34.397,
					lng : 150.644
				}
			});
			
			$("#pac-input").attr("value", labelName);
			var address = $("#pac-input").val();

			 geocoder.geocode( { 'address': address}, function(results, status) {
	    	        if (status == google.maps.GeocoderStatus.OK) {
	    	            map.setCenter(results[0].geometry.location);
	    	            var marker = new google.maps.Marker({
	    	                map: map,
	    	                position: results[0].geometry.location
	    	            });
	    	            var lat = results[0].geometry.location.lat();
	    	            var lng = results[0].geometry.location.lng();
	    	 
	    	           console.log(lat);
	    	           console.log(lng);
	    	           
	    	           infowindow.setContent(
	                   		'<div class="wrap">' 
	                   		+ '   <div class="info">'
	                   		+ '		<div class="title"><strong>' + labelName + '</strong></div><br>'
	                   		+ '        <div class="body">'
	                   		+ '            <div class="desc">' 
	                   		+ '					<div class="ellipsis"><strong>주소: </strong>' + results[0].formatted_address +'</div>'
	       					+ '					<div class="jibun ellipsis"><strong>위치정보: </strong>' + lat + ", " + lng + '</div><br>'
	       					+ '            </div>'
	       					+ '        </div>'
	       					+ '   </div>'
	       					+ '</div>')
	       					
	                   infowindow.open(map, marker);
	    	           $("#lat").attr('value', lat);
	    	           $("#lng").attr('value', lng);
	    	        } 
	    	    });
		}
                
                
            }
 		
</script>

<body>
<h1>photoDetails view</h1>

	<div>
		<img id="img" style="width: 500px; height: 375px" src="${photoDetail.photoimg}"/>
	</div>

	<input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개 
	<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
	<textarea name="photocontent" rows="10" cols="90" style="resize: none">${photoDetail.photocontent}</textarea>
	<div id="hashtag"><a href="#">#${photoDetail.keyword}</a></div>
	<input type="date" name="dateoftravel" value="${dateoftravel}"> 


	<div id="upResult2"></div>
	<div>
		<p> 위치정보를 받아오시겠습니까?</p>
		<input type="button" id="callMap" value="확인">
		<input type="button" id="cancle" value="취소">
	</div>	
	<div id="map" style="width: 650px; height: 350px; display: block;">지도</div>
    <input id="pac-input" class="controls" type="hidden">
    <div id="infowindow-content"></div>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>

</body>
</html>