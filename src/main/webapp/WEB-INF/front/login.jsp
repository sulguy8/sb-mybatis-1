<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<body>
<!-- 
아이디는 5글자 이상
비밀번호는 3글자 이상
유효성 검사는 반드시 onsubmit으로 해주세요.
 -->

	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="uiId" name="uiId"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="uiPwd" name="uiPwd"></td>
		</tr>	
		<tr>
			<th colspan="2"><button id="loginBtn" type="button">로그인</button>
		</tr>
	</table>

<script>
	$(document).ready(function(){
		$('#loginBtn').on('click',function(){
			if($('#uiId').val().trim().length<5){
				alert("아이디는 5글자 이상입니다.");
				return false;
			}
			if($('#uiPwd').val().trim().length<3){
				alert("패스워드는 3글자 이상입니다.");
				return false;
			}
			var data = 'uiId=' + $('#uiId').val() + '&uiPwd=' + $('#uiPwd').val();
			$.ajax({
				url:'/user/login',
				method:'POST',
				data:data,
				success:function(res){
					if(res){
						alert('로그인 성공!');
					}else{
						alert('로그인 실패~~');
						console.log(res);
					}
					
				},
				error:function(res){
					console.log(res);
				}
			})	
		})
	})
</script>
</body>
</html>