package bps.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.board.service.BoardServiceImpl;
import bps.board.service.IBoardService;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public ReplyDelete() {
	        super();
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	         
	          //0.클라이언트 전송 시 데이터 받기(bonum)
	          int rnum = Integer.parseInt(request.getParameter("renum"));
	          
	          //1.service객체 얻기
	          IBoardService service = BoardServiceImpl.getService();
	          
	          //2.service메소드 호출하기 - 결과값 받기 - int 실행한 rowcount 
	          int res = service.replyDelete(rnum);
	          
	          //3.request에 저장
	          request.setAttribute("result", res);
	          
	          //4. view페이지로 이동-json데이터 생성
	          request.getRequestDispatcher("view/result.jsp").forward(request, response);
	       
	       }

	    }