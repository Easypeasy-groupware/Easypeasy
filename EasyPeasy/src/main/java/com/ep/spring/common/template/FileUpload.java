package com.ep.spring.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	public static String saveFile(MultipartFile upfile, HttpSession session, String folderPath) {
		// 파일의 원본명
		String originName = upfile.getOriginalFilename();
		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 5자리랜덤숫자
		int ranNum = (int)(Math.random() * 90000 + 10000); // 10000에서부터 90000개의 랜덤값(10000~99999)
		// 확장자
		String ext = originName.substring(originName.lastIndexOf(".")); // 원본명의 제일마지막에 있는 .의 위치를 알아내서 이후문자열 추출
		
		//수정하고자하는 파일명
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기(session객체 필요함->HttpSession전달받음)
		String savePath = session.getServletContext().getRealPath(folderPath);
				
		try {
			upfile.transferTo(new File(savePath + changeName)); //File import할때 java.io패키지안에있는걸로
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		} 
		
		return folderPath + changeName;
	}

}
