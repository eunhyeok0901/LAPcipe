<%@page import="bps.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String check = request.getAttribute("flag").toString();
	List<RecipeVO> list = (List<RecipeVO>)request.getAttribute("recipes");

	
	Gson gson = new Gson();
	JsonObject jobj = new JsonObject();
%>
	
	<% if(check.equals("false")){ %>
		{"flag" : "false"}			
	
	<% }else{
			out.println(gson.toJson(list));
	}
	%>



