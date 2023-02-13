
<%@page import="bps.classreview.vo.ClassReviewVO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="bps.classdetail.vo.ClassDetailVO"%>
<%@page import="bps.cookclass.vo.CookClassVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%	
 //서블릿에서 저장된 데이터 꺼냄
 
 List<CookClassVO> list = (List<CookClassVO>)request.getAttribute("list");

		 %>
 	
 	
 	<%
 	
 	Gson gson = new Gson();
 	String rlist = gson.toJson(list);
 	
 	out.print(rlist);
 	out.flush();
 	%>
 	
 	
 
 	
 
 	

 	
 
  

 