package com.jhj.file;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

	public void delete(String fname, HttpSession session) throws Exception {
		String realPath = session.getServletContext().getRealPath("resources/notice");
		System.out.println(realPath);
		System.out.println(fname);
		File file = new File(realPath, fname);
		file.delete();
	}

	public void fileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String realFolder = request.getSession().getServletContext().getRealPath("resources/notice");
		UUID uuid = UUID.randomUUID();

		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;
		String filepath = realFolder + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		
		out.println("../resources/notice/" + str_filename);
		out.close();
	}

}