package com.jhj.file;

import java.io.File;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.util.FileSaver;

@Service
public class FileService {

	@Inject
	private FileDAO fileDAO;

	public ModelAndView delete(int fnum, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		FileDTO fileDTO = fileDAO.select(fnum);
		String realPath = session.getServletContext().getRealPath("resources/notice");
		File file = new File(realPath, fileDTO.getFname());
		file.delete();
		int result = fileDAO.delete(fnum);
		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;
	}

	public String se2(ImageDTO imageDTO, HttpSession session) throws Exception{
		FileSaver fs = new FileSaver();
		String realPath = session.getServletContext().getRealPath("resources/upload"); 
		System.out.println(realPath);
		String fname = fs.saveFile(realPath, imageDTO.getFiledata());
		String conTextName = session.getServletContext().getContextPath();
		String result = "&bNewLine=true&sFileName=" 
		+ URLEncoder.encode(imageDTO.getFiledata().getOriginalFilename(), "UTF-8");
		result += "&sFileURL=" + conTextName + "/resources/upload/" + URLEncoder.encode(fname, "UTF-8"); 

		return "redirect:" + imageDTO.getCallback() + "?callback_func=" + imageDTO.getCallback_func() + result;
	}

}
