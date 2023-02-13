<%@page import="com.google.gson.Gson"%>
<%@page import="bps.classreview.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    List<ReviewVO> list = null;
	list = (List<ReviewVO>)request.getAttribute("list");
	
	Gson gson = new Gson();
	String rlist = gson.toJson(list);

	out.print(rlist);
	out.flush();
    %>