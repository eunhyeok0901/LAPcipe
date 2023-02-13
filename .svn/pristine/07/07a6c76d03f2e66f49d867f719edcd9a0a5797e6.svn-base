package bps.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bps.board.service.BoardServiceImpl;
import bps.board.service.IBoardService;
import bps.board.vo.BoardVO;

@WebServlet("/Writer.do")
public class Writer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   
    public Writer() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        //0.클라이언트 전송시 값 받기
        String title = request.getParameter("title");
        String cont = request.getParameter("cont");

        HttpSession session = request.getSession();
        String idses = (String) session.getAttribute("loginMember");
        
        BoardVO vo = new BoardVO();
        // board_no, board_date, board_con, board_title, mem_id
        vo.setBoard_con(cont);
        vo.setBoard_title(title);
        vo.setMem_id(idses);
        
        //1.service객체를 얻는다.
        IBoardService service = BoardServiceImpl.getService();
        
        //2.service메소드 호출해서 결과값 얻기
        int res = service.insertBoard(vo);
        
        //3.request에 결과값을 저장한다. 
        request.setAttribute("result", res);
        
        //4.view페이지 이동
        request.getRequestDispatcher("/view/result.jsp").forward(request, response);
        
    }

}
