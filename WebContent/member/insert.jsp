<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	//servlet에서 저장된 결과값 꺼내기
	String res = (String)request.getAttribute("resok");
	if(res!=null){
%>		
	{
		"flag" : "회원가입이 완료되어 메인으로 이동합니다"
	}



<% 	}else{	%>
		
		
	{
		"flag" : "회원가입에 실패했습니다"
	}
	
	
<% 	}

%>    