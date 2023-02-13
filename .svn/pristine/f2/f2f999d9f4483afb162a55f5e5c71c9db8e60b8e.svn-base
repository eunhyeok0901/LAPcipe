<%@page import="java.util.List"%>
<%@page import="bps.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
int startp = (Integer)request.getAttribute("spage");
int endp = (Integer)request.getAttribute("epage");
int totalp = (Integer)request.getAttribute("tpage"); 
List<BoardVO> boardlist = (List<BoardVO>) request.getAttribute("list");
%>

{
	"sp" : <%= startp %>,
	"ep" : <%= endp %>,
	"tp" : <%= totalp %>,
	"datas" : [
	
	<%
		for(int i=0; i<boardlist.size(); i++){
			BoardVO vo = boardlist.get(i);
			if(i>0) out.print(",");
    %>			
			{
				"board_no" : "<%=vo.getBoard_no() %>",
				"board_date" : "<%=vo.getBoard_date() %>",
				"board_con" : "<%=vo.getBoard_con() %>",
				"board_title" : "<%=vo.getBoard_title() %>",
				"mem_id" : "<%=vo.getMem_id() %>"
			}
	<% 		
		}
	%>
	
	]
}


