package bps.recipe.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageViewController
 */
@WebServlet("/ImageViewController.do")
public class ImageViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		String filename = request.getParameter("fileName");
		
		
		// 이미지가 저장된 폴더 경로 설정 
		String filePath = "c:/uploadFiles";
		
		// 저장될 폴더가 없으면 새로 만든다. 
		File f = new File(filePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		String imagePath = filePath + File.separator + filename;
		
		File file = new File(imagePath);
		
		
		if(file.exists()) { // 이미지 파일이 있으면... 
			// 파일 입력용 스트림 객체 생성 
			BufferedInputStream bin = new BufferedInputStream(new FileInputStream(file));
			
			// 클라이언트로 출력할 출력용 스트림 객체 생성 (Response객체 이용)
			BufferedOutputStream bout = new BufferedOutputStream(response.getOutputStream());
			
			// 두 스트림을 이용하여 입출력 작업 수행 
			byte[] buffer = new byte[1024];
			int len = 0;
			
			while( (len = bin.read(buffer))>0 ) {
				bout.write(buffer, 0, len);
			}
			bout.flush();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
