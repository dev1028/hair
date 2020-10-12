package com.yedam.hairshop.common;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.Part;

public class FileUpload {

	public static String upload(String path, Part part) {
		String returnFileName = null;
		String filename = null;

		if (part == null) {
			filename = null;
		} else {
			try {
				filename = getFilename(part);
				if (filename == null) {
					System.out.println("파일 에러");
				} else {
					// String path = request.getServletContext().getRealPath("/");
					String paths = "C:/hairapp" + path;
					if(createFolder(paths)) {
						// 파일명 중복체크
						File renameFile = FileRenamePolicy.rename(new File(paths, filename));
						try {
							part.write(paths + "/" + renameFile.getName());
						} catch (IOException e) {
							e.printStackTrace();
						}
						returnFileName = renameFile.getName();
					}
				}
			} catch (UnsupportedEncodingException e) {
				System.out.println("파일 에러");
				e.printStackTrace();
			}
		}
		return returnFileName;
	}

	private static String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;

	}

	private static boolean createFolder(String path) {
		System.out.println(path);
		File Folder = new File(path);
		boolean result = false;
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try {
				Folder.mkdirs(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
				result = true;
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
			result = true;
		}
		return result;
	}
}
