package bps.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout.do")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        HttpSession session = request.getSession();
		
		//세션 삭제하기
		session.invalidate();
		
		response.setCharacterEncoding("utf-8");
		
		
//		String script = "<meta http-equiv='Content-Type' content='text/html; charset=utf-8'"  
//				+ "<script type='text/javascript' src='script.js' charset='utf-8'>"
//				+ "alert('로그아웃되었습니다.'); "
//				+ "location.href = '"+request.getContextPath()+"/main.jsp'"
//				+ "</script>";
		
		
//		response.getWriter().print(script);
		
//		response.getWriter().write("<script>");
//		response.getWriter().write("alert('로그아웃 되었습니다.')");
//		response.getWriter().write("</script>");
		
		response.sendRedirect(request.getContextPath() + "/main.jsp");
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
