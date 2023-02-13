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

@WebServlet("/GetClassSort.do")
public class GetClassSort extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String sort = request.getParameter("sort");
		System.out.println(sort);
		ICookClassService service = CookClassServiceImpl.getservice();
		
		List<CookClassVO> list = service.getSortList(sort);
		System.out.println(list);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/list.jsp").forward(request, response);
	
	}

}
