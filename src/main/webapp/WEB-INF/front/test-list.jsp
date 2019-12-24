<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<table class="table table-bordred">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		<tbody id="tbody">
		
		</tbody>
	</table>
	<div id="pagination" align="center"></div>
</div>
<div id="pageInfo"></div>
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
			var html = '';
			for(var list of res.list){
				html += '<tr>'
				html += '<td>' + list.tiNum +'</td>';
				html += '<td>' + list.tiName +'</td>';
				html += '<td>' + list.tiAddr +'</td>';
				html += '<td>' + list.tiEtc +'</td>';
				html += '</tr>'
			}
			document.querySelector('#tbody').innerHTML = html;
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