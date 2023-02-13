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


@WebServlet("/sendMail")
public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		for(int i=0; i<3; i++) {
			temp.append((char) ((int) (rnd.nextInt(26)) + 97));
			temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			temp.append((rnd.nextInt(10)));
		}
		
		String contents = temp.toString();

		IMemberService service = MemberServiceImpl.getService();
		
		Map<String, String> mailDTO = new HashMap<String, String>();
		mailDTO.put("title", "LABcipe 임시 비밀번호 발급 메일입니다.");
		mailDTO.put("fromMail", "jennyrhdwn@naver.com");
		mailDTO.put("password","Graceb@99");
		mailDTO.put("fromName","닉네임 슬퍼용");
		mailDTO.put("toMail","baejimil92@gmail.com");
		mailDTO.put("contents",contents);

		MailUtil.sendMail(mailDTO);
		
	  response.setCharacterEncoding("utf-8");
      response.getWriter().write("메일함 확인하세용");
	}

	

}
