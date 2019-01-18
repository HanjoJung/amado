package com.jhj.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.file.FileDAO;
import com.jhj.file.FileDTO;
import com.jhj.util.FileSaver;
import com.jhj.util.Pager;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;
	@Inject
	private FileDAO fileDAO;

	public ModelAndView list(Pager pager) throws Exception {
		pager.makeRow();
		pager.makePage(productDAO.getCount(pager));
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> list = productDAO.list(pager);
		FileDTO fileDTO = new FileDTO();
		for (ProductDTO productDTO : list) {
			fileDTO.setNum(productDTO.getProductNum());
			fileDTO.setKind("p");
			productDTO.setFile(fileDAO.list(fileDTO));
		}
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		return mv;
	}

	public ModelAndView selectOne(int productNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		ProductDTO productDTO = productDAO.selectOne(productNum);
		if (productDTO != null) {
			FileDTO fileDTO = new FileDTO();
			fileDTO.setNum(productDTO.getProductNum());
			fileDTO.setKind("p");
			mv.addObject("fileList", fileDAO.list(fileDTO));
			mv.addObject("productDTO", productDTO);
			mv.setViewName("product/product");
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

		FileSaver fs = new FileSaver();
		String realPath = session.getServletContext().getRealPath("resources/img/product-img");
		System.out.println(realPath);

		if (result > 0) {
			for (MultipartFile data : f1) {
				if (data.isEmpty()) {
					continue;
				}
				FileDTO fileDTO = new FileDTO();
				fileDTO.setNum(productDTO.getProductNum());
				fileDTO.setOname(data.getOriginalFilename());
				fileDTO.setFname(fs.saveFile(realPath, data));
				fileDTO.setKind("p");

				result = fileDAO.insert(fileDTO);

				if (result < 1) {
					throw new SQLException();
				}
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", "작성 성공");
		return mv;
	}

	public int update(ProductDTO productDTO) throws Exception {
		return productDAO.update(productDTO);
	}

	public int delete(int productNum) throws Exception {
		return productDAO.delete(productNum);
	}

	public List<ProductDTO> cart() throws Exception {
		List<String> ar = new ArrayList<String>();
		ar.add("1");
		ar.add("2");
		ar.add("3");
		ar.add("4");
		ar.add("5");
		ar.add("6");
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("cart", ar);
		return productDAO.cart(map);
	}
}
