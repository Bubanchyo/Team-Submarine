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

	$(function() {
		//글자수 제한 수정해야 함. 
		$('#albumtitle')
				.keyup(
						function() {
							var characterCount = $(this).val().length, current = $('#current'), maximum = $('#maximum'), theCount = $('#the-count');

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
								theCount.css('font-weight', 'bold');
							} else {
								maximum.css('color', '#666');
								theCount.css('font-weight', 'normal');
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
			<li class="sidebar-brand"><a class="js-scroll-trigger"
				href="#page-top">Start Bootstrap</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#page-top">Home</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#about">About</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#services">Services</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#portfolio">Portfolio</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger"
				href="#contact">Contact</a></li>
		</ul>
	</nav>


	<form action="createAlbum" method="POST" enctype="multipart/form-data">
		<section class="content-section" id="portfolio">
			<div class="container">
				<div class="content-section-heading text-center">
					<h3 class="text-secondary mb-0">Create an Album</h3>
					<h2 class="mb-5">Upload your Photo</h2>
				</div>

				<div class="avatar-upload">
					<div class="avatar-edit">
						<input type='file' id="imageUpload" name="uploadfile"
							accept=".png, .jpg, .jpeg" onchange="readURL(this)" /> <label
							for="imageUpload"
							style="background-image: url(./resources/img/pencil.png); background-size: 30px 30px; background-repeat: no-repeat; background-position: center;"></label>
					</div>
					<div class="avatar-preview">
						<div id="imagePreview"
							style="background-image: url(./resources/img/portfolio-1.jpg);">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="wrapper">
						<h4>Album Title</h4>
						<textarea name="the-textarea" id="albumtitle" name="albumtitle"
							maxlength="50" placeholder="Start Typin…" autofocus></textarea>
						<div id="the_count">
							<span id="current">0</span> <span id="maximum">/ 50</span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="wrapper">
						<h4>Album Introduction</h4>
						<textarea name="the-textarea" id="the_textarea" name="albumintro"
							maxlength="300" placeholder="Start Typin…" autofocus></textarea>
						<div id="the_count">
							<span id="current">0</span> <span id="maximum">/ 300</span>
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

		<!-- Call to Action -->
		<section id="layer_fixed" class="content-section bg-primary text-white">
			<div id="bottomnav" class="container text-center">
				<button type="submit" class="btn btn-primary">CONFIRM</button>
			</div>
		</section>


	</form>

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



	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="./resources/js/stylish-portfolio.min.js"></script>

</body>

</html>