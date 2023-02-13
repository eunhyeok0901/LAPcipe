<%@page import="com.google.gson.Gson"%>
<%@page import="bps.recipereview.vo.RecipeReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String check = (String)request.getAttribute("flag");
	List<RecipeReviewVO> reviews = (List<RecipeReviewVO>)request.getAttribute("reviews");	
	
%>

	<% if(reviews == null || reviews.size()==0){ %>
		{"flag" : "false"}
		
	<% }else{
		Gson gson = new Gson();
		out.println(gson.toJson(reviews));
	
	}
	%>	
		
	
