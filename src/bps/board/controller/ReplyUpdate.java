package bps.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.board.service.BoardServiceImpl;
import bps.board.service.IBoardService;


@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ReplyUpdate() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
        request.setCharacterEncoding("UTF-8");
        
        // 0. 클라이언트 요청 시 전송데이타 받기 - renum, cont
        int rnum = Integer.parseInt(request.getParameter("renum"));
        String cont = request.getParameter("cont");
        
        // map에 설정
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("renum", rnum);
        map.put("cont", cont);
                
        // 1. service객체 얻기
        IBoardService service = BoardServiceImpl.getService();
        
        // 2. service메소드 호출 - 결과값 받기
        int res = service.replyUpdate(map);
                
        // 3. request에 결과값 저장
        request.setAttribute("result", res);
        
        // 4. view 페이지로 이동
        request.getRequestDispatcher("/view/result.jsp").forward(request, response);
        
        
    }

}
