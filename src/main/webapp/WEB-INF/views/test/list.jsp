<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/bootstrap-reboot.min.css" />
<link rel="stylesheet" href="/css/bootstrap-grid.min.css" />

<style>
.table {
	margin : 10px auto;
}
</style>


</head>
<body>

<div class="container">
	<table class="table table-bordered">
		<tr>
			<th><input type="checkbox" onClick='allChk(this)'></th>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
	<c:forEach var="board" items="${requestScope.rMap.list}">
	<tr>
		<td><input type="checkbox" onClick='allChk(this)'>${board.tiNums}</td>
		<td>${board.tiNum}</td>
		<td>${board.tiName}</td>
		<td>${board.tiAddr}</td>
		<td>${board.tiEtc}</td>
	</tr> 
	</c:forEach>
	</table>
</div>

</body>
</html>