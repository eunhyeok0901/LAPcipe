<%@page import="com.google.gson.Gson"%>
<%@page import="bps.cookclass.vo.CookClassVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CookClassVO cvo = (CookClassVO) request.getAttribute("cvo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>

<style type="text/css">
	table, tr, td { border:1px solid red; }
	td { padding:5px;}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.1.min.js"></script>

<script type="text/javascript">



// $(function(){
// 	$("#btnList").on("click", function(){
<%-- 		location.href="<%=request.getContextPath()%>/Payment.do"; --%>
// 	});
	
	
// 	// why
// 	$("#memberForm").on("submit", function(){
// 		var idchk = $("#idChkResult").html();
// 		if(idchk!="사용가능"){
// 			alert("ID 중복되거나 중복체크를 하지 않았습니다.");
// 			return false;  // 전송 중단.
// 		}
// 		if($("#mem_pass").val()!= $("#mem_pass2").val()){
// 			alert("비밀번호와 비밀번호 확인이 다릅니다. 다시 확인하세요.");
// 			return false;
// 		}
		
// 		return true; 
// 	});
// });
$(function(){
	ttt=$('body a').text().trim();
	console.log(ttt);
// 화면을 출력하는데..모달로 할 것인지..? 모달로 갔을 떄 유지를 해서 넘기기?
		
	
getClass = function(){
	// del : 댓글 삭제 버튼 this로 반은 변수
	$.ajax({
		
		url : '/PaymentForm.do',
		type : 'post',
		data : {"renum" : vidx },
		success : function(res){
			alert(res.flag);
			// del 댓글 삭제 버튼을 기준으로 조상 rep-body 삭제.
// 			$(del).parents('.rep-body').remove();
		},
			error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
		
	})
};

test = function(){
	<%-- 세션을 써서 사용. 세션 생성.--%>
	vid = $('#pway').text();
	vno = $('#cno').html().trim();
	console.log(vid,vno);
	
	$.ajax({
		url : '/rps_mpro/PaymentInsert.do',
		type : 'post',
		data : {"memId" : "a001",
				"classNo": vno},
		success : function(res){
// 			alert(res.flag);
			
// 			$('#memberForm').html(code);
			
		},
			error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType : 'json'
	})
};

$(document).on('click', 'span',  function(){
	
	 vidx = $(this).text().trim();
	 console.log(vidx);
	 
	 
})
$('#btnList').on('click',function(){
	test();
})
})
</script>
</head>


<body>
<h2>회원 정보 입력 폼</h2>
<form id="memberForm" method="post" action="<%=request.getContextPath()%>/PaymentInsert.do" enctype="multipart/form-data">
<table border="1">
<tbody>
	<tr>
		<td>Class NO</td>
		<td>
		<span id="cno" name="no"><%= cvo.getClass_no() %></span>
<!-- 			<input type="text" name="mem_id" id="mem_id"> -->
<!-- 			<span id="idChkResult">test</span> -->
		</td>
	</tr>
	<tr>
		<td>Class Name</td>
		<td>
		<span><%= cvo.getClass_title() %></span>
<!-- 			<input type="text" name="mem_id" id="mem_id"> -->
<!-- 			<span id="idChkResult">test</span> -->
		</td>
	</tr>
	<tr>
		<td>Price</td>
		<td>
<!-- 		<input type="password" name="mem_pass" id="mem_pass"> -->
		<span name="price"><%= cvo.getClass_price() %></span>
		</td>
	</tr>
	<tr>
		<td>Pay Way</td>
		<td><select>
		<option id="pway" name="kp">카카오페이</option>
		<option id="pway" name="pp">포인트</option>
		</select>
		</td>
	</tr>	
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="button" id="btnList" value="제출">
			<input type="reset" value="취소">
			</td>
<!-- 			<input type="submit" onclick= test() value="저장">  -->
			
	</tr>
</tbody>
</table>
</form>
</body>
