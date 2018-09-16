<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Custom CSS -->
<!-- 
<link href="./resources/css/myProfile.css" rel="stylesheet">
-->

<style type="text/css">


body {
	width: 100%;
	height: 100%;
	min-height: 100vh;
	margin: 0;
	background-color: #f1deda;
	font-family: 'Poppins', sans-serif;
	color: rgba(0,0,0,0.8);
}

.pfl-wrapper {
	display: block;
	width: auto;
	height: 100%;
	padding: 40px;
	margin: 50px;
	background-color: #f1deda;
	box-shadow: 0 0 50px rgba(0,0,0,0.08);
	overflow: auto;
}

article {
	display: block;
	width: auto;
	height: auto;
	padding: 50px 0;
	overflow: auto;
}

article .profile-photo {
	display: block;
	width: 130px;
	height: 130px;
	border-radius: 50%;
	background-color: #fff;
	margin: 0 auto;
	background-image: url("http://nickylew.com/wp-content/uploads/2017/05/nickylew-2017.jpg");
	background-size: 230%;
	background-position: 80% 0%;
	background-repeat: no-repeat;
}

article .profile-info {
	display: block;
	width: 100%;
	max-width: 400px;
	margin: 0 auto;
	text-align: center;
}

article .profile-info h1 {
	font-size: 2em;
	font-weight: 600;
	margin-top: 0.5em;
}

article .people,
article .posts {
	display: inline-block;
	width: 100%;
	margin: 60px 0 0;
	float: left;
}

article .people .round-tile {
	display: inline-block;
	float: left;
	margin-bottom: 30px;
	text-align: center;
	text-decoration: none;
}

article .people .round-tile:hover {
	text-decoration: none;
}

article .people .round-tile:hover .roundal {
	box-shadow: 0 0 50px rgba(0,0,0,0.08);
	transition: box-shadow 0.25s;
}

article .people .round-tile:hover h4 {
	color: #0275d8;
	transition: color 0.25s;
	text-decoration: none;
}

article .people .round-tile .roundal {
	display: block;
	margin: 0 auto 10px;
	width: 90px;
	height: 90px;
	background-color: #363636;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	transition: box-shadow 0.25s;
}


	
</style>

</head>

<body>
<div class="pfl-wrapper">


	<article>
		<div class="profile-photo"></div>
		<div class="profile-info">
			<h1>Nick Lewis</h1>
			<p>gender${gender}</p>
			<p>useremail${useremail}</p>
			<!-- 
			<p>Creative technologist <a href="http://fiascodesign.co.uk/" target="_blank">@FiascoDesign</a>. Maker of web things. Joint owner <a href="http://mountainandco.uk/" target="_blank">@mountainandco</a>.</p>
			 -->
		</div>
		<div class="col-xs-12">
			<div class="col-md-6 people">
				<img src="./resources/img/stamp/big_ben.jpg" style="width: 40px; height: 40px;">
					<div class="roundal">
					<h4>CodePen</h4>
					</div>
			</div>
			<div class="col-md-6 people">
				<img src="./resources/img/stamp/big_ben.jpg" style="width: 40px; height: 40px;">
					<div class="roundal">
					<h4>CodePen</h4>
					</div>
			</div>
			<div class="col-md-6 people">
				<img src="./resources/img/stamp/big_ben.jpg" style="width: 40px; height: 40px;">
					<div class="roundal">
					<h4>CodePen</h4>
					</div>
			</div>
		</div>
	</article>
</div>
</body>
</html>

