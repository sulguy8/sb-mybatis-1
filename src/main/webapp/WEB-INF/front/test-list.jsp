<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<table class="table table-bordred">
		<tr>
			<th><input type="checkbox" onClick='allChk(this)'></th>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		<tbody id="tbody">
		
		</tbody>
	</table>
	<div id="pagination" align="center"></div>
	<button data-page="test-insert">게시물 작성</button>
	<button onclick="deleteTestInfo()">게시물 삭제</button>
</div>
<div id="pageInfo"></div>
<script>
function allChk(obj){
	var states = obj.checked;
		if(states){
			$('.chkbox').attr('checked', true);
		} else{
			$('.chkbox').attr('checked', false);
		}
			
}


$(document).ready(goPage(1));
var rowCount =10;

function deleteTestInfo(){
	var checkedObjs = $('input[type=checkbox][name=chkbox]:checked');
	var tiNums = [];
	for(var i=0; i<checkedObjs.length; i++){
	tiNums[i] = checkedObjs[i].value;
	}
	console.log(tiNums);
	var tiNumss = {
			tiNums : tiNums
	};
	console.log(tiNumss);
	$.ajax({
		url:'/testss',
		method:'DELETE',
	 	data: JSON.stringify(tiNumss),
		beforeSend : function(xhr){
	 		xhr.setRequestHeader('Content-type','application/json;charset=UTF-8');
	 	},
		success:function(res){
			alert(res);
		}
	})
}

function goPage(page){
	$.ajax({
		url:'/tests',
		method:'GET',
	 	data:'page.page=' + page, 
		success:function(res){
			var html = '';
			for(var list of res.list){
				html += '<tr>';
				html += '<td><input type="checkbox" class="chkbox" name="chkbox" value="' + list.tiNum + '"></td>'
				html += '<td id="'+list.tiNum+'">' + list.tiNum +'</td>';
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
			if(ePage != totalPage){
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
	$('td[id]').on('click',function(){
		var tiNum = this.innerText;
		location.href='/?page=test-view&tiNum=' + tiNum;
	})
}

</script>