package bps.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.board.service.BoardServiceImpl;
import bps.board.service.IBoardService;
import bps.board.vo.ReplyVO;

@WebServlet("/ReplySave.do")
public class ReplySave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 
    public ReplySave() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        //0.클라이언트 전송시 값을 받는다.
        String bonum = request.getParameter("bonum");
        int bnum = Integer.parseInt(bonum);
        
        String cont = request.getParameter("cont");

        ReplyVO vo = new ReplyVO();
        //com_no, board_no, com_con
        vo.setBoard_no(bnum);
        vo.setCom_con(cont);
        vo.setCom_name("관리자");
        
        //1.service객체를 얻는다.
        IBoardService service = BoardServiceImpl.getService();
        
        //2.service메소드 호출해서 결과값 얻기
        int res = service.replySave(vo);
        
        //3.request에 결과값을 저장한다. 
        request.setAttribute("result", res);
        
        //4.view페이지 이동
        request.getRequestDispatcher("/view/result.jsp").forward(request, response);
    }

}
