package bps.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bps.member.service.IMemberService;
import bps.member.service.MemberServiceImpl;
import bps.member.vo.MemberVO;

@WebServlet("/memberView.do")
public class MemberView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String memId = request.getParameter("memId");
		System.out.println("memverview 서블릿이닷"+request.getParameter("memId"));
		
		IMemberService service = MemberServiceImpl.getService();
		
		MemberVO mvo = new MemberVO();
		
		mvo = service.getMember2(memId);
		
				Gson job = new Gson();
				String jsonData = null;
				jsonData = job.toJson(mvo);
				System.out.println(jsonData);
				response.setContentType("application/json; charset=utf-8");  // 응답을 JSON으로 하겠다는 설정
//		System.out.println("MemberView Do다!"+mvo.getMem_point());
//		RequestDispatcher rd = request.getRequestDispatcher("/member/memberView.jsp");
//		rd.forward(request, response);
				PrintWriter out = response.getWriter();
				
				out.write(jsonData);
				
				response.flushBuffer();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
