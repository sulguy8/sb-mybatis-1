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
<div>
	id : <input type="text" id="id"><br>
	pwd : <input type="password" id="pwd"><br>
	<button id="login">로그인</button>
</div>

<script>
	var btn = document.querySelector('#login');
	
	var	params = {
			id : 'ABCD',
			pwd : '12ABCDE'
	}	
	
	$(btn).on('click',function(){
		$.ajax({
			url:'/user/login',
			method:'POST',
			data: JSON.stringify(params),
	 		beforeSend : function(xhr){
	 			xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
	 		},
			success:function(res){
				if('ok' == res.login){
						alert('로그인 성공!');
				} else if('fail' == res.login){
						console.log('error');
						alert('로그인 실패!');
					}
			}		
		})
	})
</script>

</body>
</html>