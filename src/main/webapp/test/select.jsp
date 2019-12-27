<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.div {
	border-style : solid;
	border-width : thin;
	display : block;
	width : 45%;
	height : 40px;	
	float : left;
}
.leftDiv {
	background : gray;
}
.rightDiv{
	background : white;
}
</style>
</head>
<body>

<div class="div leftDiv">
<jsp:include page="/test/left.jsp"></jsp:include>
</div>

<div class="div rightDiv">
<c:if test="${not empty param.page}">
	<jsp:include page="/test/${param.page}.jsp"></jsp:include>
</c:if>
</div>	

<script>
function changePage(f){
	location.href= f.value; 
}
window.onload = function(){
	var page = '${param.page}';
	if(page){
		document.querySelector('#page').value = page;
	}
}

</script>
</body>
</html>