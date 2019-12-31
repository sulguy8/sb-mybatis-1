<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.loader{
	position:absolute;
	border: 16px solid #f3f3f3;
	border-top: 16px solid #3498db;
	border-radius:50%;
	width:120px;
	height: 120px;
	animation: spin 2s linear infinite;
}
</style> 
</head>
<body>
<div id="enters">
</div>
<div class="loader"></div>
<script>
function load(page){
	$('.loader').css('display','');
	var data = 'page=' + page + '&pageSize=30';
	$.ajax({
		url : '/boardinfos',
		method:'GET',
		data : data,
		success : function(res){
			console.log(res);
			console.log(res.length);
			var html = '';
			for(var i=0;i<res.length;i++){
				var bi = res[i];
				html += '<h1>' + bi.biTitle + '</h1>'
				html += '<h4> 글쓴이 : ' + bi.biWriter + '</h4>'; 
				if(bi.biFile){
					html += '<img src="/resources/' + bi.biFile + '"><br>';
				}
				html += '<div class="content">' + bi.biContent + '</div>'
			}
			$("#enters").append(html);
			$('.loader').css('display','none');
		}
	})	 
}

var page = 1;
$(document).ready(function(){
	if($("body").height() < $(window).height()){
		load(page);
	}
});

$(window).scroll(function(){
	var reload =$(document).height() - $(window).height() - $(window).scrollTop();
	if(reload>=0 && reload<=1){
	console.log(++page);
	load(page);
	}
});


/* $(document).ready(function(){
    if ($("body").height() < $(window).height()) {
    	var data = 'page=' + page + '&pageSize=30';
    	$.ajax({
    		url : '/boardinfos',
    		method:'GET',
    		data : data,
    		success : function(res){
    			var html = '';
    			for(var i=0;i<res.length;i++){
    				var bi = res[i];
    				html += '<h1>' + bi.biTitle + '</h1>'
    				html += '<h4> 글쓴이 : ' + bi.biWriter + '</h4>'; 
    				if(bi.biFile){
    					html += '<img src="/resources/' + bi.biFile + '"><br>';
    				}
    				html += '<div class="content">' + bi.biContent + '</div>'
    			}
    			$("#enters").append(html);
    		}
    	})	 
    }
});



$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      ++page;
      $("#enters").append("<h1>Page " + page + "</h1><BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~<BR/>So<BR/>MANY<BR/>BRS<BR/>YEAHHH~");
      
    }
}); */
</script>
</body>
</html>