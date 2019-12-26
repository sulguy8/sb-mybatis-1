<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <table class="table table-bordered">
 	<tr>
 		<th>번호</th>
 		<td>${param.tiNum}</td>
 	</tr>	
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
 		<th colspan="2"><button id="tiUpdate">수정</button>
 	</tr>
 	
 </table>    
  
<script>
	var tiNum = '${param.tiNum}';
	$(document).ready(function(){
		$.ajax({
			url:'/test',
			method:'GET',
			data:'tiNum=${param.tiNum}',
			success:function(res){
				console.log();
				$('#tiName').val(res.list[0].tiName);
				$('#tiAddr').val(res.list[0].tiAddr);
				$('#tiEtc').val(res.list[0].tiEtc);
			}		
		})
	})
	
	 	$(document).ready(function(){
 		$('#tiUpdate').on('click',function(){
 			var param = {
 						tiNum : ${param.tiNum},
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
 	 			method:'PUT',
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