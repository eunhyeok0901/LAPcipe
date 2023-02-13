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


@WebServlet("/memberDelete.do")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String memId = request.getParameter("mem_id");
		
		IMemberService service = MemberServiceImpl.getService();
		
		HttpSession session = request.getSession();
		
		int cnt = service.deleteMember(memId);
		
		
		if(cnt>0) {
			session.invalidate();		
			response.getWriter().append("<script>")
			.append("alert('회원탈퇴가 완료되어 메인 페이지로 이동합니다.');")
			.append("window.parent.location.href='"+ request.getContextPath() + "/main.jsp';")
			.append("</script>");
		}else {
			response.getWriter().append("<script>")
			.append("alert('회원탈퇴에 실패했습니다. 문의게시판을 이용해주세요');")
			.append("history.go(-1);")
			.append("</script>");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
