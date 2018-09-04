<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setHeader("Content-Type", "text/html;charset=utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

var sel_file;

$(document).ready(function(){
	$("#FILE_TAG").on("change", handleImgFileSelect);
});

 function handleImgFileSelect(e){
	 var files = e.target.files;
	 var filesArr = Array.prototype.slice.call(files);
	 
	 filesArr.forEach(function(f){
		/*  if(f.type.match("image.*")){
			 alert("확장자는 이미지 확장자만");
			 return ;
		 } */
		 sel_file = f;
		 
		 var reader = new FileReader();
		 reader.onload = function(e){
			 $("#img").attr("src" , e.target.result);
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
                                    }
                            	})
                            }
                    });
            }
</script>	
	
<body>
<h1>CREATE POST view</h1>

<div>
	<img id="img" style="width: 500px; height: 375px"/>
</div>

<form id="fileform" action="registerPhoto" method="POST" enctype="multipart/form-data">
	<input type="file" id="FILE_TAG" name="uploadfile">
	<input id="photoimg" type="hidden" name="photoimg">
	<input type="hidden" name="albumno" value=${albumno}><br>
    <input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개
	<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
		<textarea name="photocontent" rows="10" cols="90" style="resize: none"></textarea>
	<div id="hashtag">해 시 태 그 들 어 갈 곳</div>
	<input id="hiddenhash" type="hidden" name="keyword"> 
	<input type="button" value="해시태그받아오기" onclick="uploadFile()"><br>
	<input type="date" name="dateoftravel">
	<input type="submit" value="파일업로드">
</form>


</body>
</html>
