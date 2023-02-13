<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="bps.recipenote.vo.RecipeNoteVO"%>
<%@page import="bps.recipe.vo.RecipeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
List<RecipeVO> list1 = (List<RecipeVO>)request.getAttribute("recipes");
List<RecipeNoteVO> list2 = (List<RecipeNoteVO>)request.getAttribute("notes");
String check = (String)request.getAttribute("flag");

JsonObject job = new JsonObject();

job.addProperty("flag", check);

Gson gson = new Gson();

JsonElement ele1 = gson.toJsonTree(list1);
JsonElement ele2 = gson.toJsonTree(list2);

job.add("list1", ele1);
job.add("list2", ele2);

out.println(job);
%>