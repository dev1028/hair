package com.yedam.hairshop.common;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

public class ImgViewCtrl implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = request.getParameter("img_name"); //파일이름
		if(filename == null || filename.equals("")) {
			System.out.println("filename is null");
			return;
		}
		
		String pathLocation = request.getParameter("img_path"); //중간 경로 이름쓰기
		String realPath = "C:/hairapp" + pathLocation + "/" +filename;
		System.out.println(realPath);
		File file = new File(realPath);
		String downName = new String(filename.getBytes("utf-8"), "iso-8859-1");
		
		//파일이 없으면 종료
		if(! file.exists() ) {
			System.out.println("not find image: " + file.getPath());
			return;
		}
		// 응답 헤더를 다운로드로 설정
		response.reset();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		FileUtils.copyFile(file, response.getOutputStream());
		
		response.getOutputStream().close();
	}

}
