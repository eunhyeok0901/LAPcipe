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


@WebServlet("/SearchId.do")
public class SearchId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//전송되어 온 파라미터 읽기
		String name = request.getParameter("memName");
		String email = request.getParameter("memEmail");
		
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_name(name);
		memVo.setMem_email(email);
	   
		IMemberService service = MemberServiceImpl.getService();
		
		
		MemberVO membervo = service.searchId(memVo);
		
		
		if(membervo != null) {
			//session.setAttribute("memId", memId);
			response.getWriter().write(membervo.getMem_id());
		}else {
			response.getWriter().write("해당 정보를 가진 아이디를 찾을 수 없습니다.");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
