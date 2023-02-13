<%@page import="bps.classdetail.vo.DetailVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bps.classdetail.vo.ClassDetailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


List<DetailVO> list = (List<DetailVO>)request.getAttribute("list");

Gson gson = new Gson();
String rlist = gson.toJson(list);

out.print(rlist);
out.flush();

%>
