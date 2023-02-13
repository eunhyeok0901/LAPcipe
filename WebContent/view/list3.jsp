<%@page import="bps.classreview.vo.ClassReviewVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<ClassReviewVO> reviewlist = (List<ClassReviewVO>)request.getAttribute("reviewlist");

 	
 	%>
 	
 
 		<%
 	
 		Gson gsonreview = new Gson();
 	 	String rvlist = gsonreview.toJson(reviewlist);
 	 	
 	 	out.print(rvlist);
 	 	out.flush();
 	%>
 	
 	