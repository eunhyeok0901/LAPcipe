<%@page import="bps.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/view/header1.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>
<%
	MemberVO vo = (MemberVO) session.getAttribute("loginMember");
	String memId = null;
	if(vo == null){
			System.out.println("로그인 되어 있지 않습니다.");
	}else{
		System.out.println("로그인 ");
		memId = vo.getMem_id();
	}
%>
<script>
// $(function(){
// 	ttt=$('body a').text().trim();
// 	console.log(ttt);
	
	
// getClass = function(){
// 	// del : 댓글 삭제 버튼 this로 반은 변수
// 	$.ajax({
		
// 		url : '/PaymentForm.do',
// 		type : 'post',
// 		data : {"renum" : vidx },
// 		success : function(res){
// 			alert(res.flag);
// 			// del 댓글 삭제 버튼을 기준으로 조상 rep-body 삭제.
// // 			$(del).parents('.rep-body').remove();
// 		},
// 			error : function(xhr){
// 			alert("상태 : " + xhr.status)
// 		},
// 		dataType : 'json'
		
// 	})
// }

// test = function(){
// 	$.ajax({
// 		url : '/PaymentInsert.do',
// 		type : 'post',
// 		data : {"memId" : "a001"},
// 		success : function(res){
// 			alert(res.flag);
			
// 		},
// 			error : function(xhr){
// 			alert("상태 : " + xhr.status)
// 		},
// 		dataType : 'json'
// 	})
// }

// $(document).on('click', 'a',  function(){
	
// 	 vidx = $(this).text().trim();
	 
	 
// })
// })
// $(function(){
// 	ttt= $('a').text();
// // 	console.log(ttt);
// 	$('h2').on('click',function(){
// 		alert(ttt);
// 	$.ajax({
// 		url : '/rps_mpro/PaymentInsert.do',
// 		type : 'post',
// 		data : {"classNo" : ttt},
// 		success :function(res){
// 			alert("성공");

			
// 		},
// 		error : function(xhr){
// 			alert("상태 : " + xhr.status)
// 		},
// 		dataType : 'json'
// 	})
// 	})
		
	
	
	
	
// })
	var id = '<%=memId%>';
	
$(function(){
// 	ttt= $('h2').eq(2).text().trim();
// 	ttt= $('h2').eq(1).text();
// 	console.log(ttt);
// 	console.log(id);
	$('h2').on('click',function(){
		alert(ttt);
	$.ajax({
		url : '/rps_mpro/PaymentForm.do',
		type : 'post',
		data : {"classNo" : 3},
		success :function(res){
// 			alert("성공");
// 			code ='';
<%-- 			code += '<a href="<%=request.getContextPath()%>/PaymentForm.do"></a>'; --%>
			
// 			console.log(code);
// 			$('#test').html(code);
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
	})
	
})


</script>
</head>

<body>

<div id="test"></div>
<a  href="<%=request.getContextPath()%>/PaymentForm.do">3</a>
<h2> 3 </h2>
<h2> 4 </h2>
<h2> 5 </h2>
</body>
</html>