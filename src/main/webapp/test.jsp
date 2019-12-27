<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.test {
		display : block;
		background : red;
		float : left;
		margin : 10px;
	}
	
	.test1 { 
		
		
		
	}
	.test2 { 
		
	}
	

</style>
</head>
<body>
	<div class="test test1">안녕? <jsp:include page="/NewFile.jsp"></jsp:include> </div>
	<div class="test test2">반갑다 <jsp:include page="/NewFile.jsp"></jsp:include></div>
	
</body>
</html>