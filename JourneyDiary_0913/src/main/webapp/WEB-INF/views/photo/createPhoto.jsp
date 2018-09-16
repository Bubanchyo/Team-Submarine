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

<title>- Start Bootstrap Template</title>

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
<link href="./resources/css/createAlbum.css" rel="stylesheet">

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
	
$(function(){
	//글자수 제한 수정해야 함. 
	$('#albumtitle').keyup(function() {
	  var characterCount = $(this).val().length,
	      current = $('#current'),
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
</script>

<!--  -->
<script type="text/javascript">

/* 변수들 */
var sel_file;
var markers = [];
var geocoder;
var labelName = '';
var placeSearch, autocomplete; //검색 자동완성
var map;
var marker;
var infowindow;



	/* 썸네일 이미지 변경 */
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
		
		var form = $('#fileform')[0];
        var formData = new FormData(form);
        formData.append("fileObj", $("#imageUpload")[0].files[0]);
        
        $.ajax({
        	url:"ajaximage",
                    processData: false,
                    contentType : false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                    	imageAnalysis(result);
                    	$("#photoimg").val(result);
                    	//$("#fileform").submit();
                    }
            });
		
		
	}
	
	/* 썸네일 이미지 변화시 */
	$("#imageUpload").change(function(e) {
		readURL(this);
	});
	
	/* 이미지 분석 */
	function imageAnalysis(tempImg){
		 $.ajax({
         	url:"imageAnalysis",
            data: 'tempImg=' + tempImg,
            type: 'POST',
            success: function(result){
            	var tokens = tokenizer(result);
            	$('#search').html('');
            	if(tokens.length == 1){
            		labelName = result;
					getPhotoInfo();
					initMap(labelName);
            	}else{
            		getPhotoInfo();
            		initMap_Land(result);
            	}
            }
         });
	}
	
	
	/* 맵 초기화 */
	function initMap(labelName) {
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 15,
			center : {
				lat : -34.397,
				lng : 150.644
			}
		});
		if(autocomplete == null) {
			photoGeometry();
		}
		
		if(autocomplete != null) {
			cancleTemp();
		}
	}
	
	/* 랜드마크 디텍팅 초기화 */
	function initMap_Land(result) {
		var tokens = tokenizer(result);
		
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 15,
			center : {
				lat : parseFloat(tokens[1]),
				lng : parseFloat(tokens[2])
			}
		});
		
		geocoder = new google.maps.Geocoder();
		infowindow = new google.maps.InfoWindow;

		var latlng = {lat: parseFloat(tokens[1]), lng: parseFloat(tokens[2])};
		geocoder.geocode({'location': latlng},function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				console.log(results[0].geometry.location);
				var marker = new google.maps.Marker({
					position : latlng,
					map : map
				});
				infowindow.setContent('<div class="wrap">'
				+ '<div class="info">'
				+ '<div class="title"><strong>'
				+ tokens[0]
				+ '</strong></div><br>'
				+ '<div class="body">'
				+ '<div class="desc">'
				+ '<div class="ellipsis"><strong>주소: </strong>'
				+ results[0].formatted_address
				+ '</div>'
				+ '<div class="jibun ellipsis"><strong>위치정보: </strong>'
				+ tokens[1] + ", " + tokens[2]
				+ '</div><br>'
				+ '</div>'
				+ '</div>'
				+ '</div>' 
				+ '</div>')

				infowindow.open(map, marker);
				console.log('이게실행됨');
			} else {
				alert('Geocode was not successful for the following reason: '
					+ status);
			}
			
			$("#lat").attr('value', tokens[1]);
			$("#lng").attr('value', tokens[2]);
		});
	}
	
	
	/* 문자열 자르기 */
	function tokenizer(tokens){
		var str = tokens.split(";");
		return str;
	}
	
	
	/* 사진 웹분석 */
	function photoGeometry(){
		geocoder = new google.maps.Geocoder();
		infowindow = new google.maps.InfoWindow;
		$("#pac-input").attr("value", labelName);
		var address = $("#pac-input").val();
		geocoder.geocode({'address' : address},function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				var lat = results[0].geometry.location.lat();
				var lng = results[0].geometry.location.lng();

				infowindow.setContent('<div class="wrap">'
				+ '<div class="info">'
				+ '<div class="title"><strong>'
				+ labelName
				+ '</strong></div><br>'
				+ '<div class="body">'
				+ '<div class="desc">'
				+ '<div class="ellipsis"><strong>주소: </strong>'
				+ results[0].formatted_address
				+ '</div>'
				+ '<div class="jibun ellipsis"><strong>위치정보: </strong>'
				+ lat + ", " + lng
				+ '</div><br>'
				+ '</div>'
				+ '</div>'
				+ '</div>' 
				+ '</div>')

				infowindow.open(map, marker);

				$("#lat").attr('value', lat);
				$("#lng").attr('value', lng);

			} else {
				alert('Geocode was not successful for the following reason: '
					+ status);
			}
		});
	}
	
	/* 마커 웹분석 */
	function placeSearchBox() {
		marker = null;
		geocoder = new google.maps.Geocoder();
		infowindow = new google.maps.InfoWindow;
		
		var input = document.getElementById('pac-input2');
		var searchBox = new google.maps.places.SearchBox(input);
		
		map.addListener('bounds_changed', function() {
	    	searchBox.setBounds(map.getBounds());
	    });
		
		markers = [];
		
		searchBox.addListener('places_changed', function() {
	        var places = searchBox.getPlaces();

	        if (places.length == 0) {
	        return;
	    }
	        
	     // Clear out the old markers.
	   	markers.forEach(function(marker) {
	    	marker.setMap(null);
	    });
	    markers = [];    
	       
	    var bounds = new google.maps.LatLngBounds();
	    places.forEach(function(place) {
	    	if (!place.geometry) {
	    		console.log("Returned place contains no geometry");
	    		return;
	    	}
	   	markers.push(new google.maps.Marker({
	   		map: map,
	    	title: place.name,
	    	position: place.geometry.location
	    }));
	    if (place.geometry.viewport) {
              // Only geocodes have viewport.
            bounds.union(place.geometry.viewport);
        } else {
            bounds.extend(place.geometry.location);
        }
	    });
          map.fitBounds(bounds);
        });
	} 
	
	
	
	/* 취소버튼을 눌렀을 때 */
	function cancleTemp(){
		$("#upResult2").html('');
		var text2 = '';
		
		text2 += '<div class="pac-card" id="pac-card">';
		text2 += '<div class="pac-sec">';
		text2 += '<div id="title">Autocomplete search</div>';
		text2 += '<div id="pac-container">';
		text2 += '<input id="pac-input2" type="text" placeholder="Enter a location">';
		text2 += '</div>';
		text2 += '</div>';
		text2 += '</div>';
		
		$('#search').html(text2);
		
		placeSearchBox();
	}
	
	/* 위치정보 획득 */
	function getPhotoInfo() {
		var text = '';

		text += '<div> ';
		text += '<p> 해당 위치정보가 맞습니까?';
		text += '<input type="button" id="callMap" value="확인">';
		text += '<input type="button" id="cancle" value="취소">';
		text += '</p> ';
		text += '</div> ';

		$("#upResult2").html(text);
		
		$("#callMap").on('click', function(){
			$("#upResult2").html('');
			
		});
		
		$("#cancle").on('click', function(){
			$("#upResult2").html('');
			
			//임시분리
			cancleTemp();
		});
	}
	
	function posting(){
		$('#fileform').submit();
	} 

</script>
<!--  -->

</head>

<body id="page-top">

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
          <a class="js-scroll-trigger" href="#page-top">Home</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#about">About</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#services">Services</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#portfolio">Portfolio</a>
        </li>
        <li class="sidebar-nav-item">
          <a class="js-scroll-trigger" href="#contact">Contact</a>
        </li>
      </ul>
    </nav>


<form action="createPhoto" method="POST" enctype="multipart/form-data">
	<section class="content-section" id="portfolio">
		<div class="container">
			<div class="content-section-heading text-center">
         		 <h3 class="text-secondary mb-0">Create an Album</h3>
         		 <h2 class="mb-5">Upload your Photo</h2>
       		</div>
			
			<div class="avatar-upload">
				<div class="avatar-edit">
				<!-- <input multiple="multiple" type="file" name="filename[]"/> -->
					<input type='file' id="imageUpload" name="uploadfile" accept=".png, .jpg, .jpeg" onchange="readURL(this)" />
					<label for="imageUpload" style="background-image: url(./resources/img/templates/pencil.png); background-size: 30px 30px; background-repeat: no-repeat; background-position: center;"></label>
				</div>
				<div class="avatar-preview">
					<div id="imagePreview" style="background-image: url(./resources/img/templates/portfolio-1.jpg);">
					</div>
				</div>
			</div>
			<div class="card my-4">
				<div class="form-group">
					<h5 class="card-header">Privacy</h5>
					<input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개 
					<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
				</div>
			</div>		
			<div class="card my-4">
				<div class="form-group">
					<h5 class="card-header">Content</h5>
					<textarea class="form-control" name="photocontent" rows="10" cols="auto" style="resize: none"></textarea>
				</div>
			</div>			
				<div class="form-group">
					<div class="wrapper">
						<h4>Album Title</h4>
  						<textarea id="albumtitle" name="title" maxlength="50" placeholder="Start Typin…" autofocus></textarea>
  							<div id="the_count">
    							<span id="current">0</span>
    							<span id="maximum">/ 50</span>
  							</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="wrapper">
						<h4>Privacy</h4>
  							<input type="radio" class="privacyCheck" value="public">공개
  							<input type="radio" class="privacyCheck" value="private">비공개
					</div>
				</div>
	
				<div class="form-group">
					<div class="wrapper">
						<h4>Album Introduction</h4>
  						<textarea id="the_textarea" name="albumintro" maxlength="300" placeholder="Start Typin…" autofocus></textarea>
  							<div id="the_count">
    							<span id="current">0</span>
    							<span id="maximum">/ 300</span>
  							</div>
					</div>
				</div>
				<div class="form-group">
					<div class="wrapper">
						<h4>Start Date</h4>
  						<input type="date" class="form-control" name="startdate" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="wrapper">
						<h4>End Date</h4>
  						<input type="date" class="form-control" name="enddate" />
					</div>
				</div>
		</div>
	</section>

</form>	

<br><br><br><br><br><br><br><br><br><br><br><br>

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="./resources/js/stylish-portfolio.min.js"></script>

</body>

</html>
