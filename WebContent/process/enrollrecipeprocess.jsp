<%@page import="bps.ingreunit.vo.IngreunitVO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
List<IngreunitVO> list1 = (List<IngreunitVO>)request.getAttribute("list1");
List<IngreunitVO> list2 = (List<IngreunitVO>)request.getAttribute("list2");

JsonObject job = new JsonObject();

Gson gson = new Gson();

JsonElement ele1 = gson.toJsonTree(list1);
JsonElement ele2 = gson.toJsonTree(list2);

job.add("list1", ele1);
job.add("list2", ele2);

out.println(job);
%>


