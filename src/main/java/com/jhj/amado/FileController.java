package com.jhj.amado;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhj.file.FileService;

@Controller
@RequestMapping(value = "**/file/*")
public class FileController {

	@Inject
	private FileService fileService;

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(String fname, HttpSession session) throws Exception {
		fileService.delete(fname, session);
	}

	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	@ResponseBody
	public void fileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		fileService.fileUpload(file, request, response);
	}

}
