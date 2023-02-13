package bps.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.board.service.BoardServiceImpl;
import bps.board.service.IBoardService;
import bps.board.vo.BoardVO;
import bps.board.vo.PageVO;


@WebServlet("/ListPage.do")
public class ListPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListPage() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
        
        // 0. 클라이언트 요청시 전송되는 데이터 받기
        String spage = request.getParameter("page");
        int cpage = Integer.parseInt(spage);
        
        //최초로 실행시 stype과 sword의 값이 존재하지 않는다. 
        String stype = request.getParameter("stype");
        String sword = request.getParameter("sword");
        
        // 1. service객체 얻어오기
        IBoardService service = BoardServiceImpl.getService();
        
        //start와  end값은 계산-page번호가 기준
        //service의 pageInfo(page, type, word)메소드 호출 - PageVo를 리턴받는다.
        //PageVo: start, end, startPage, endPage, totalPage
        PageVO vo = service.pageInfo(cpage, stype, sword);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", vo.getStart());
        map.put("end", vo.getEnd());
        map.put("stype", stype);
        map.put("sword", sword);
        
        // 2. service메서드 호출하기(결과값)
        List<BoardVO> list = service.listByPage(map);
        
        // 3. request에 결과값 저장하기
        request.setAttribute("list", list);
        request.setAttribute("spage", vo.getStartPage());
        request.setAttribute("epage", vo.getEndPage());
        request.setAttribute("tpage", vo.getTotalPage());
        
        // 4. view페이지로 이동
        request.getRequestDispatcher("/view/boardList.jsp").forward(request, response);
    }
}
