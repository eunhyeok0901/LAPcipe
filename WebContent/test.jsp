<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	$('body a').on('click', function(){
		ttt = $('body a').text().trim();
		console.log(ttt);
		
		$.ajax({
			url : '/jqpro/Payment.do',
			type : 'get',
			data : {"renum" : ttt},
			success : function(res){
				
// 				code = "";
// 				$.each(res, function(i, v){
// 					code +=  `<p  onclick="detail('${res[i].id}')"  id="${res[i].id}" > ${res[i].name} </p>`
// 				})
				
// 				$('#names').html(code);
			},
			dataType : 'json'
			
		})//ajax
		
	})///click
	
})// $function
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="<%=request.getContextPath()%>/PaymentForm.do">3</a>
<h2>3번 클래스를 수강하게 된다고 가정하자</h2>
</body>
</html>