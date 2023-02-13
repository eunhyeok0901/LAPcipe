<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 //서블릿에서 저장된 데이터 꺼내기
 String res = (String)request.getAttribute("result");
 
 if(res!=null){
	 //사용불가능
 %>
 
 		{
 			"flag": "사용 불가능 아이디"
 		
 		}

 
	 
 <% }else{
	 //사용가능
 %>
 		{
 			"flag": "사용 가능 아이디"
 		
 		}


 <%	 
  	}
 %>
 