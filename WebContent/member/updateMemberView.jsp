<%@page import="bps.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>


<style>
table, tr, td {
	border: 1px solid blue;
	border-collapse: collapse;
}

td {
	padding: 5px;
}

</style>

<%
MemberVO memVo = (MemberVO)session.getAttribute("updateMemberVO");
%>


<script>


	
	
	
	
	
	


// 	$("#btnUpdate").on("click", function(){
// 		var form = document.getElementById("memberForm");
// 		form.method = "GET";
<%-- 		form.action = "<%=request.getContextPath()%>/memberUpdate.do"; --%>
// 		form.submit();
// 	});

	
// 	$("#btnDelete").on("click", function(){
// 		var form = document.getElementById("memberForm");
<%-- 		form.action = "<%=request.getContextPath()%>/memberDelete.do"; --%>
// 		form.submit();
// 	});
		



	
	
</script>



</head>
<body>


	
	<%
	if(memVo != null){
	%>
	 
	<h2>회원 정보 상세보기</h2>
	<form name="memberForm" id="memberForm">
		<input type="hidden" id="mem_id" name="mem_id"
			value="<%=memVo.getMem_id()%>">
		<table border="1">
			<tbody>
				<tr>
					<td>회원ID</td>
					<td><%=memVo.getMem_id()%></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=memVo.getMem_name()%></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><%=memVo.getMem_nickname()%></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><%=memVo.getMem_tel()%></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><%=memVo.getMem_add()%></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=memVo.getMem_email()%></td>
				</tr>
				<tr>
					<td>보유 포인트</td>
					<td><%=memVo.getMem_point()%></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input id="btnAmend" type="button" value="회원정보 수정" data-toggle="modal" data-target="#checkPw">
					<input id="btnDelete" type="button" value="회원 탈퇴" data-toggle="modal" data-target="#checkPw2">
				</tr>
			</tbody>
		</table>
	</form>
	
	
	<!-- 회원정보 수정 시 비밀번호 입력 modal -->
   <div class="modal fade" id="checkPw">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style="text-align: center;"><b>비밀번호 입력</b></h3><br>
          <br>
          
  		
          <div style="text-align: center;">
             <input type="text" name="checkPw" id="cPw" class="text_field" placeholder="비밀번호" required
             style=" border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
          </div>
			
		  <div style= "width: 55%; text-align:center; margin-left: 120px;">
			  <div class="alert alert-danger" id="alert-danger3">
			  	비밀번호가 일치하지 않습니다
			  </div>
		  </div>
		  	
          <div id="recheckPw" style="text-align: center;">
            <button type="button" id="submitPw"
            style="width: 60%; height: 50px; border: none; border-bottom: 1px solid #ccc; outline:none; border-radius: 40px;
            background:#8C8CBE;
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;">
          	확인</button>
          </div>
        
        </div>
        
      </div>
      
    </div>
  </div>

  
	<!-- 회원 탈퇴 시 비밀번호 입력 modal -->
   <div class="modal fade" id="checkPw2">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body" style="margin: 20px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" style="text-align: center;"><b>비밀번호 입력</b></h3><br>
          <br>
          
  		
          <div style="text-align: center;">
             <input type="text" name="checkPw" id="cPw2" class="text_field" placeholder="비밀번호" required
             style=" border:none; border-bottom: solid 1px #ccc;
             border-radius: 30px; padding: 8px 0px 5px 10px; margin-bottom:8px;
             width: 60%; height:45px;">
          </div>
			
		  <div style= "width: 55%; text-align:center; margin-left: 120px;">
			  <div class="alert alert-danger" id="alert-danger4">
			  	비밀번호가 일치하지 않습니다
			  </div>
		  </div>
		  	
          <div id="recheckPw" style="text-align: center;">
            <button type="button" id="submitPw2"
            style="width: 60%; height: 50px; border: none; border-bottom: 1px solid #ccc; outline:none; border-radius: 40px;
            background:#8C8CBE;
            color: white; font-size: 1.2em; letter-spacing: 2px; margin-bottom: 20px; font-weight: bold;">
          	확인</button>
          </div>
        
        </div>
        
      </div>
      
    </div>
  </div>
	
	
<%}%>
	
	
<script>
$('#alert-danger3').hide();

$('#submitPw').on("click", function(){
	
    var pass = $('#cPw').val();
	if(pass == '<%=memVo.getMem_pass()%>'){
		location.href="<%=request.getContextPath()%>/member/memberUpdateForm.jsp";
	
	}else{
			$('#alert-danger3').show();
		$('#cPw').val('');
	}
	
	
})

$('#alert-danger4').hide();

$('#submitPw2').on("click", function(){
	
    var pass = $('#cPw2').val();
	
	if(pass == '<%=memVo.getMem_pass()%>'){
		var form = document.getElementById("memberForm");
		
		form.action = "<%=request.getContextPath()%>/memberDelete.do";
		form.submit();
	}else{
		$('#alert-danger4').show();
		$('#cPw2').val('');
	}
	
	
})
</script>
	
	
	
	
		
</body>
</html>