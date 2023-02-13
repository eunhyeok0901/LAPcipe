<%@page import="bps.buyedclass.vo.BuyedVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bps.buyedclass.vo.BuyedClassVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
       <%
    List<BuyedVO> list = null;
	list = (List<BuyedVO>)request.getAttribute("list");
	
	Gson gson = new Gson();
	String rlist = gson.toJson(list);

	out.print(rlist);
	out.flush();
    %>