<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./resources/js/sockjs.js"></script>
<script>
	$(document).ready(function(){
		$("#sendBtn").click(function(){
			sendMessage();			
		});
	});
	var sock;
	function sendMessage(){
		sock = new SockJS("<c:url value=/"echo"/>");
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = function(){
			sock.send()
		}
	}
</script>
<body>
	logger.log();
</body>
</html>