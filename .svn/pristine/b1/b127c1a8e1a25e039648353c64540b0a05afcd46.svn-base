<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//서블릿에서 저장된 결과값 꺼내기
	int res = (Integer)request.getAttribute("result");
	if(res > 0){
%>
	{
		"flag" : "등록이 완료됐습니다"	
	}

<%		
	}else{
%>

	{
		"flag" : "등록에 실패했습니다"
	}

<%		
	}
%>