<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="page" onchange="changePage(this)">
	<option value="${param.page}">선택</option>
	<option value="select.jsp?page=r1">r1</option>
	<option value="select.jsp?page=r2">r2</option>
	<option value="select.jsp?page=r3">r3</option>
</select>

</body>
</html>