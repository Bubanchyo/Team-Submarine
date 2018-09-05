<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setHeader("Content-Type", "text/html;charset=utf-8");
%>
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
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : -34.397,
				lng : 150.644
			},
			zoom : 8
		});
	}
</script>
<script>



var sel_file;
var markers = [];
var geocoder;
var labelName='';

$(document).ready(function() {
	$("#FILE_TAG").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		/*  if(f.type.match("image.*")){
			 alert("확장자는 이미지 확장자만");
			 return ;
		 } */
		sel_file = f;

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}


 function uploadFile(){
                var form = $('#fileform')[0];
                var formData = new FormData(form);
                formData.append("fileObj", $("#FILE_TAG")[0].files[0]);

                $.ajax({
                	url:"ajaximage",
                            processData: false,
                            contentType : false,
                            data: formData,
                            type: 'POST',
                            success: function(result){
                            	$("#photoimg").val(result);
                            	
                            	var savedata = result;
                            	
                            	console.log(savedata);
                            	
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
                    });
                
                /////////////
                function getPhotoInfo(resp) {
			var text = '';

			text += '<div> ';
			text += '<p> 위치정보를 받아오시겠습니까?';
			text += '<input type="button" id="callMap" value="확인">';
			text += '<input type="button" id="cancle" value="취소">';
			text += '</p> ';
			text += '</div> ';	

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
			
			//$("#pac-input").attr("type", "hidden");
			
			//$("#pac-input").val() = labelName;
			$("#pac-input").attr("value", labelName);
			var address = $("#pac-input").val();
			
			console.log(labelName);
			//map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

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
	    	           
	    	           
	    	        } else {
	    	            alert('Geocode was not successful for the following reason: ' + status);
	    	        }
	    	    });
		}
                
                //////내부함수///////
                
                
                
                
                
                
            }
 		
</script>

<body>
	<h1>CREATE POST view</h1>

	<div>
		<img id="img" style="width: 500px; height: 375px" />
	</div>

	<form id="fileform" action="registerPhoto" method="POST"
		enctype="multipart/form-data">
		<input type="file" id="FILE_TAG" name="uploadfile">
		<input id="photoimg" type="hidden" name="photoimg">
		<input type="hidden" name="albumno" value="${albumno}"><br>
		<input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개 
		<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
		<textarea name="photocontent" rows="10" cols="90" style="resize: none"></textarea>
		<div id="hashtag">해 시 태 그 들 어 갈 곳</div>
		<input id="hiddenhash" type="hidden" name="keyword">
		<input type="button" value="해시태그받아오기" onclick="uploadFile()"><br>
		<input type="date" name="dateoftravel"> 
		<input id="lat" type="hidden" name="lat">
		<input id="lng" type="hidden" name="lng">
		<input type="submit" value="파일업로드">
	</form>
	<div id="upResult2"></div>
	<div id="map" style="width: 650px; height: 350px; display: block;">지도</div>
    <input id="pac-input" class="controls" type="hidden">
    <div id="infowindow-content"></div>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
</body>
</html>
