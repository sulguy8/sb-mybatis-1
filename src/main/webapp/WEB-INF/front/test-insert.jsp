<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>게시물 작성</h3>

<!-- 
이름 : 2글자 이상 1000글자 이하, null 불가
주소 : 10글자 이상 200글자 이하, null 불가
비고 : 1000글자 이하, null 가능
 -->
 
 <table class="table table-bordered">
 	<tr>
 		<th>이름</th>
 		<td><input type="text" name="tiName" id="tiName" maxlength="100"></td>
 	</tr>
 	 	<tr>
 		<th>주소</th>
 		<td><input type="text" name="tiAddr" id="tiAddr" maxlength="200"></td>
 	</tr>
 	 	<tr>
 		<th>비고</th>
 		<td><textarea name="tiEtc" id="tiEtc" cols=30 rows=10 maxlength="1000"></textarea></td>
 	</tr>
 	<tr>
 		<th colspan="2"><button id="tiInsert">등록</button>
 	</tr>
 	
 </table>
 <script>
 
 	$(document).ready(function(){
 		$('#tiInsert').on('click',function(){
 			var param = {
						tiName : document.getElementById('tiName').value,
						tiAddr : document.getElementById('tiAddr').value,
						tiEtc : document.getElementById('tiEtc').value
 			}
 			
 			if($('#tiName').val().trim().length<2){
 				alert('아이디는 2글자 이상입니다.');
 				return false;
 			} 
 			if ($('#tiAddr').val().trim().length<10){
 				alert('주소는 10글자 이상입니다.');
 				return false;
 			} 
 	 		$.ajax({
 	 			url:'/tests',
 	 			method:'POST',
 	 			data: JSON.stringify(param),
 	 			beforeSend : function(xhr){
 	 				xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
 	 			},
 	 			success:function(res){
 	 				if(res){
 	 					alert('입력 성공!');
 	 				} else{
 	 					alert('입력 실패!');
 	 				}
 	 			}
 	 		})
 		})
 	})
 </script>
 