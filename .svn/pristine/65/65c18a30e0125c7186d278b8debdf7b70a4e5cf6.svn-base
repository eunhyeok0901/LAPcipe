package bps.member.controller;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bps.member.service.IMemberService;
import bps.member.service.MemberServiceImpl;
import bps.member.vo.MemberVO;


@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//전송되어 온 파라미터 읽기
		String userId = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(userId);
		memVo.setMem_pass(pass);
		
		IMemberService service = MemberServiceImpl.getService();
		
		HttpSession session = request.getSession();
		
		
		MemberVO loginMemVo = service.login(memVo);
		
		
		//로그인 성공여부 판단
		if(loginMemVo != null) {
			session.setAttribute("loginMemberVO", loginMemVo);
			session.setAttribute("loginMember", loginMemVo.getMem_id());
			
		}else {
			response.getWriter().write("로그인에 실패하였습니다! 다시 입력해주세요.");
		}
		
		
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	

}
