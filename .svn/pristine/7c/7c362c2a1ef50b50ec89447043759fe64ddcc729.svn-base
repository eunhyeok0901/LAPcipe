package bps.cookclass.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.cookclass.service.CookClassServiceImpl;
import bps.cookclass.service.ICookClassService;
import bps.cookclass.vo.CookClassVO;

/**
 * Servlet implementation class SearchResult
 */
@WebServlet("/SearchResult.do")
public class SearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String select = request.getParameter("select");
		String keyword = request.getParameter("keyword");
		
		ICookClassService service = CookClassServiceImpl.getservice();
		
		//서비스 추가하러 고고
		List<CookClassVO> list = service.searchMaterial(keyword);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list.jsp").forward(request, response);
	}

}
