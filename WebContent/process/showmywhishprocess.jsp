<%@page import="com.google.gson.Gson"%>
<%@page import="bps.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String check = request.getAttribute("flag").toString();
	List<RecipeVO> list = (List<RecipeVO>)request.getAttribute("recipes");

	
	Gson gson = new Gson();
%>
	
	<% if(check.equals("false")){ %>
		{"flag" : "false"}			
	
	<% }else{
			out.println(gson.toJson(list));
	}
	%>
    