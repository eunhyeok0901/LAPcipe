package bps.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bps.member.service.IMemberService;
import bps.member.service.MemberServiceImpl;
import bps.member.util.MailUtil;
import bps.member.vo.MemberVO;


@WebServlet("/SearchPass.do")
public class SearchPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("memId2");
		String email = request.getParameter("memEmail2");
		System.out.println(id);
		System.out.println(email);
		
		MemberVO memVo = new MemberVO();
		memVo.setMem_id(id);
		memVo.setMem_email(email);
		System.out.println(id);
		System.out.println(email);
		
		IMemberService service = MemberServiceImpl.getService();
		
		int result = service.searchPass(memVo);
		System.out.println(result);
		
		
		
		if(result != 0) {
//			System.out.println("시작");
			
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			
//			System.out.println("시작2");
//			System.out.println(email);
			
			for(int i=0; i<3; i++) {
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				temp.append((rnd.nextInt(10)));
			}
			
//			System.out.println("시작3");
			String contents = temp.toString();
			memVo.setMem_pass(contents);
			
			service.updatePass(memVo);
			

			System.out.println(memVo);
			Map<String, String> mailDTO = new HashMap<String, String>();
			mailDTO.put("title", "LABcipe 임시 비밀번호 발급 메일입니다.");
			mailDTO.put("fromMail", "jennyrhdwn@naver.com");
			mailDTO.put("password","Graceb@99");
			mailDTO.put("fromName","LABcipe");
			mailDTO.put("toMail", email);
			mailDTO.put("contents",contents);
			System.out.println("시작4");
			
			MailUtil.sendMail(mailDTO);
			System.out.println("aasdasdasd");
	        response.getWriter().write("메일함을 확인하세요");
			
		}else {
			response.getWriter().write("해당 정보를 가진 회원을 찾을 수 없습니다.");
		}
		
	}

	


}
