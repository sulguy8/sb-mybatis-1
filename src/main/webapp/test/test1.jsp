<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!--
이름(tiName) :  2글자 이상 100글자 이하, 필수값
주소(tiAddr) : 10글자이상 200글자 이하, 필수값
비고(tiEtc) : 1000글자 이하, 필수값 아님 
 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<body>
<div id="div1">
	이름 : <input type="text" id="tiName" name="tiName"><br>
	주소 : <input type="text" id="tiAddr" name="tiAddr"><br>
	비고 : <input type="text" id="tiEtc" name="tiEtc">
	<button id="insert">작성완료</button>
</div>

<script>
 	$('#insert').on('click',function(){
		if($('[name=tiName]').val().trim().length == 0){
			alert('이름은 필수 입력 항목입니다.')
			return false;
		} else if($('[name=tiName]').val().trim().length<2){
			alert('이름은 2글자 이상 100글자 이하 입니다.');
			return false;	
		} else if($('[name=tiName]').val().trim().length>100){
			alert('이름은 2글자 이상 100글자 이하 입니다.')
			return false;
		} 
	
		if($('[name=tiAddr]').val().trim().length == 0){
			alert('주소는 필수 입력 항목입니다.')
			return false;
		} else if($('[name=tiAddr]').val().trim().length<10){
			alert('주소는 10글자 이상 200글자 이하 입니다.');
			return false;	
		} else if($('[name=tiAddr]').val().trim().length>200){
			alert('주소는 10글자 이상 200글자 이하 입니다.')
			return false;
		} 
		
		if($('[name=tiEtc]').val().trim().length>1000){
			alert('비고는 1000글자 이하 입니다.');
			return false;		
		}
	}) 
	
	var btn = document.querySelector('#insert');
 	
	btn.onclick = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('POST','/test');
	xhr.setRequestHeader('Content-Type','application/json');

	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var result = JSON.parse(xhr.responseText);
				console.log(result);
			}
		}
	}
	var datas = {
			tiName : document.querySelector('#tiName').value,
			tiAddr : document.querySelector('#tiAddr').value,
			tiEtc : document.querySelector('#tiEtc').value
	}
	xhr.send(JSON.stringify(datas));
	}
</script>

</body>
</html>