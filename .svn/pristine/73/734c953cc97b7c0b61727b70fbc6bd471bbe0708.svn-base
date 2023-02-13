package bps.curriculum.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.curriculum.service.CurriculumServiceImpl;
import bps.curriculum.service.ICurriculumService;

/**
 * Servlet implementation class GetUrl
 */
@WebServlet("/GetUrl.do")
public class GetUrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("classTitle");
	
	ICurriculumService service = CurriculumServiceImpl.getService();
	
	String url = service.getURL(title);
	System.out.println(url);
	
	response.setCharacterEncoding("utf-8");
	
	response.getWriter().write(url);
//	request.getRequestDispatcher("/view/mypage.jsp").forward(request, response);
	}

}
