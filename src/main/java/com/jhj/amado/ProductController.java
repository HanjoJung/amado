package com.jhj.amado;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.product.ProductDTO;
import com.jhj.product.ProductService;
import com.jhj.util.Pager;

@Controller
@RequestMapping(value = "product/*")
public class ProductController {
	@Inject
	private ProductService productService;

	@RequestMapping("shop")
	public void shop() throws Exception {
	}

	@RequestMapping("product_area")
	public ModelAndView product_area(Pager pager) throws Exception {
		ModelAndView mv = productService.list(pager);
		mv.setViewName("product/product_area");
		return mv;
	}

	@RequestMapping("product")
	public ModelAndView product(String productCode) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("productDTO", productService.selectOne(productCode));
		mv.setViewName("product/product");
		return mv;
	}

	@RequestMapping("insert")
	public void insert() throws Exception {
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView insert(ProductDTO productDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		ModelAndView mv = productService.insert(productDTO, f1, session);
		mv.setViewName("redirect:./shop");
		return mv;
	}

	@RequestMapping("update")
	public void update() throws Exception {
	}

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public ModelAndView checkout() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/checkout");
		return mv;
	}

	@RequestMapping("wishList")
	public ModelAndView wishList() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/wishList");
		return mv;
	}
}
