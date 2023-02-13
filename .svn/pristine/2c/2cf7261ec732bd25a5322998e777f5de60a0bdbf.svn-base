package bps.curriculum.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.curriculum.service.CurriculumServiceImpl;
import bps.curriculum.service.ICurriculumService;
import bps.curriculum.vo.CurriculumVO;

/**
 * Servlet implementation class PlayClass
 */
@WebServlet("/PlayClass.do")
public class PlayClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		request.setCharacterEncoding("utf-8");
		
		int classNo = Integer.parseInt(request.getParameter("classNo"));
		
		ICurriculumService service = CurriculumServiceImpl.getService();
		
		CurriculumVO vo = service.getCurri(classNo);
		String curri_name = vo.getCur_name();
		String url = vo.getCur_video();
//		System.out.println("링크 확인");
//		System.out.println(url);
		
//		request.getRequestDispatcher("/view/classMain.jsp").forward(request, response);
		
		
		PrintWriter out = response.getWriter();
		out.write(url);
//		out.write(curri_name);

		out.flush();
		
	
	}

}
