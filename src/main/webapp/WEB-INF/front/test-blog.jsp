<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/front/blog.jsp"></jsp:include><br>

<jsp:include page="/WEB-INF/front/blog.jsp"></jsp:include><br>

<jsp:include page="/WEB-INF/front/blog.jsp"></jsp:include><br>

<script>
$(document).ready(goPage(1));

var rowCount =10;

function goPage(page){
	$.ajax({
		url:'/tests',
		method:'GET',
	 	data:'page.page=' + page, 
		success:function(res){
			console.log(res);
			var a = 0;
			for(var b=0; b<100; b++){
				var html = '';
				for(var i=0; i<3; i++){
					html += '<tr>'
					html += '<td>' + res.list[i].tiNum + '</td>';
					html += '<td>' + res.list[i].tiName + '</td>';
					html += '<td>' + res.list[i].tiAddr + '</td>';
					html += '<td>' + res.list[i].tiEtc + '</td>';
					html += '</tr>'
				}
				
				document.querySelectorAll('[name=tbody]')[a].innerHTML = html;
				
				html = '';
				for(var i=3; i<6; i++){
					html += '<tr>'
					html += '<td>' + res.list[i].tiNum + '</td>';
					html += '<td>' + res.list[i].tiName + '</td>';
					html += '<td>' + res.list[i].tiAddr + '</td>';
					html += '<td>' + res.list[i].tiEtc + '</td>';
					html += '</tr>'
				}
				
				document.querySelectorAll('[name=tbody]')[a+1].innerHTML = html;
				html = '';
				for(var i=6; i<9; i++){
					html += '<tr>'
					html += '<td>' + res.list[i].tiNum + '</td>';
					html += '<td>' + res.list[i].tiName + '</td>';
					html += '<td>' + res.list[i].tiAddr + '</td>';
					html += '<td>' + res.list[i].tiEtc + '</td>';
					html += '</tr>'
				}
				
				document.querySelectorAll('[name=tbody]')[a+2].innerHTML = html;
			}
			
			var totalPage = Math.ceil(res.page.totalCount/rowCount);
			var sPage = Math.floor((res.page.page-1)/10)*10 + 1;
			var ePage = sPage + 9;
			if(ePage>totalPage){
				ePage = totalPage;
			}
			var html ='';
			if(sPage!=1){
				html += '<a data-page="' + (sPage-10) + '">◀</a>';
			}
			for(var i=sPage; i<=ePage; i++){
				if(i==res.page.page){
					html += '[' + i + ']';
				} else {
					html += '<a data-page="' + i + '"> [' + i + ']</a>';
				}
			}
			if(sPage!=91){
				html += '<a data-page="' + (sPage+10) + '">▶</a>'
			}
			$('#pagination').html(html);
			setEvent();
		}
	})	
}


function setEvent(){
	$('a[data-page]').on('click',function(){
		goPage(this.getAttribute('data-page'));
	})
}

</script>
</body>
</html>