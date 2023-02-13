package bps.member.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bps.member.service.IMemberService;
import bps.member.service.MemberServiceImpl;
import bps.member.vo.MemberVO;


@WebServlet("/memberUpdate.do")
@MultipartConfig
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        
	        String memPass = request.getParameter("mem_pass");
	        String memName = request.getParameter("mem_name");
	        String memNickname = request.getParameter("mem_nickname");
	        String memTel = request.getParameter("mem_tel");
	        String memAdd = request.getParameter("mem_add");
	        String memEmail = request.getParameter("mem_email");
	        
	        HttpSession session = request.getSession();
	        	   
	        MemberVO memVo = (MemberVO) session.getAttribute("loginMemberVO");
	        MemberVO updateVo = new MemberVO();
	        updateVo.setMem_id(memVo.getMem_id());
	        updateVo.setMem_pass(memPass);
	        updateVo.setMem_name(memName);
	        updateVo.setMem_nickname(memNickname);
	        updateVo.setMem_tel(memTel);
	        updateVo.setMem_add(memAdd);
	        updateVo.setMem_email(memEmail);
	        updateVo.setMem_point(memVo.getMem_point());;
	        
			IMemberService service = MemberServiceImpl.getService();
			
	        int updateMember = service.updateMember(updateVo);
	        
	        session.setAttribute("loginMemberVO", updateVo);
	        
	        if(updateMember > 0) {
	        	response.getWriter().append("<script>")
	        	.append("alert('회원정보 수정이 완료됐습니다');")
	        	.append("location.href='"+ request.getContextPath() +"/member/memberView.jsp'")
	        	.append("</script>");
	        }else {
	        	response.getWriter().append("<script>")
				.append("alert('회원정보 수정에 실패했습니다. 문의게시판을 이용해주세요');")
				.append("history.go(-1);")
				.append("</script>");
	        }
	        
	    
    }
	

}