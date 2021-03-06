package com.jhj.product;

import java.io.File;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.file.FileDAO;
import com.jhj.file.FileDTO;
import com.jhj.util.FileSaver;
import com.jhj.util.Pager;

@Service
@Transactional
public class ProductService {

	@Inject
	private ProductDAO productDAO;
	@Inject
	private FileDAO fileDAO;

	public ModelAndView list(Pager pager) throws Exception {
		pager.makeRow();
		int totalCount = productDAO.getCount(pager);
		pager.makePage(totalCount);
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> list = productDAO.list(pager);
		for (ProductDTO productDTO : list) {
			productDTO.setFile(fileDAO.list(productDTO.getProductNum()));
		}
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		return mv;
	}

	public ModelAndView selectOne(int productNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		ProductDTO productDTO = productDAO.selectOne(productNum);
		if (productDTO != null) {
			mv.addObject("fileList", fileDAO.list(productDTO.getProductNum()));
			mv.addObject("productDTO", productDTO);
			mv.setViewName("product/select");
		} else {
			mv.addObject("msg", "존제하지 않는 상품입니다.");
			mv.setViewName("redirect:./shop");
		}
		return mv;
	}

	public ModelAndView insert(ProductDTO productDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		int seq = productDAO.seqNext();
		productDTO.setProductNum(seq);
		int result = productDAO.insert(productDTO);

		if (result < 1) {
			throw new SQLException();
		}

		FileSaver fs = new FileSaver();
		String realPath = session.getServletContext().getRealPath("resources/img/product-img");
		System.out.println(realPath);

		for (MultipartFile data : f1) {
			if (data.isEmpty()) {
				continue;
			}
			FileDTO fileDTO = new FileDTO();
			fileDTO.setNum(productDTO.getProductNum());
			fileDTO.setOname(data.getOriginalFilename());
			fileDTO.setFname(fs.saveFile(realPath, data));

			result = fileDAO.insert(fileDTO);

			if (result < 1) {
				throw new SQLException();
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "작성 성공");
		mv.addObject("reload", "product");
		return mv;
	}

	public ModelAndView update(ProductDTO productDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		int result = productDAO.update(productDTO);

		if (f1 != null) {
			FileSaver fs = new FileSaver();
			String realPath = session.getServletContext().getRealPath("resources/img/product-img");
			System.out.println(realPath);

			if (result < 1) {
				throw new SQLException();
			}

			List<FileDTO> fileList = fileDAO.list(productDTO.getProductNum());
			for (int i = 0; i < f1.size(); i++) {
				if (f1.get(i).isEmpty()) {
					continue;
				}

				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(productDTO.getProductNum());
				fileDTO.setOname(f1.get(i).getOriginalFilename());
				fileDTO.setFname(fs.saveFile(realPath, f1.get(i)));

				if (fileList.size() > i) {
					fileDTO.setFnum(fileList.get(i).getFnum());
					result = fileDAO.update(fileDTO);
					if (result < 1) {
						throw new SQLException();
					}
					File file = new File(realPath, fileList.get(i).getFname());
					file.delete();
				} else {
					result = fileDAO.insert(fileDTO);
					if (result < 1) {
						throw new SQLException();
					}
				}
			}
		}
		ModelAndView mv = new ModelAndView();
		return mv;
	}

	public String delete(int productNum, HttpSession session) throws Exception {
		List<FileDTO> ar = fileDAO.list(productNum);
		int result = productDAO.delete(productNum);

		if (result < 1) {
			throw new SQLException();
		}

		String realPath = session.getServletContext().getRealPath("resources/img/product-img");
		for (FileDTO fileDTO2 : ar) {
			File file = new File(realPath, fileDTO2.getFname());
			file.delete();
		}

		return "삭제 하였습니다.";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public ModelAndView checkout() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/checkout");
		return mv;
	}

	public ModelAndView latest(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		Cookie[] cookies = request.getCookies();
		String[] cookieValues = null;
		String value = "";

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("todayView")) {
					value = cookies[i].getValue();
					cookieValues = (URLDecoder.decode(value, "UTF-8")).split(",");
					break;
				}
			}
		}

		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("productNum", cookieValues);
		List<ProductDTO> list = productDAO.latest(map);
		for (ProductDTO productDTO : list) {
			productDTO.setFile(fileDAO.list(productDTO.getProductNum()));
		}

		if (cookieValues != null) {
			for (int i = 0; i < cookieValues.length; i++) {
				for (int j = i; j < list.size(); j++) {
					if (Integer.parseInt(cookieValues[i]) == list.get(j).getProductNum()) {
						ProductDTO temp = list.get(i);
						list.set(i, list.get(j));
						list.set(j, temp);
					}
				}
			}
		}
		mv.addObject("list", list);

		return mv;
	}
}
