package com.tworaveler.tlog;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.tworaveler.tlog.member.MemberVO;

@SpringBootApplication
public class TlogApplication {

	public static void main(String[] args) {
		SpringApplication.run(TlogApplication.class, args);
	}
	@Value("${spring.servlet.multipart.location}")
	private static String uploadPath;

	public static void profileImgUpload(MemberVO vo, HttpServletRequest request) {
		String profilePath = uploadPath+"user/";
		String path = request.getSession().getServletContext().getRealPath(profilePath);
		MultipartFile file = ((MultipartRequest) request).getFile("profileImgs");
		if(!file.getOriginalFilename().equals("")) {
			String orgFileName = file.getOriginalFilename();
			int point = orgFileName.lastIndexOf(".");
			String ext = orgFileName.substring(point+1);
			
			orgFileName = System.currentTimeMillis()+"."+ext;
			File f = new File(path+orgFileName);
			
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			vo.setProfileImg(profilePath+orgFileName);
		}
	}
	
	public static void removeImg(String imgRealPath) {
		File f = new File(imgRealPath);
		if(f.exists()) {
			f.delete();
		}
	}
}
