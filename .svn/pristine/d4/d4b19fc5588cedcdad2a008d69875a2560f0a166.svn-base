package bps.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.board.service.BoardServiceImpl;
import bps.board.service.IBoardService;

@WebServlet("/BoardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //0.클라이언트 전송 시 데이터 받기(bonum)
        int bnum = Integer.parseInt(request.getParameter("bonum"));
        
        //1.service객체 얻기
        IBoardService service = BoardServiceImpl.getService();
        
        //2.service메소드 호출하기 - 결과값 받기 - int 실행한 rowcount 
        int res = service.deleteBoard(bnum);
        
        //3.request에 저장
        request.setAttribute("result", res);
        
        //4. view페이지로 이동-json데이터 생성
        request.getRequestDispatcher("/view/result.jsp").forward(request, response);
     
     }

  }