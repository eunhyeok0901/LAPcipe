<%@page import="bps.buyedclass.vo.BuyedClassVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
    
    int count = (int)(request.getAttribute("count"));
	out.print(count);
	out.flush();

	%>