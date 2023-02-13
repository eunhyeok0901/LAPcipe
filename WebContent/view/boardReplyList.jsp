<%@page import="bps.board.vo.ReplyVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//서블릿에서 저장된 데이터 꺼내기
List<ReplyVO> list = (List<ReplyVO>)request.getAttribute("replyList");

Gson gson = new Gson();

String rlist = gson.toJson(list);

out.print(rlist);
out.flush();


%>