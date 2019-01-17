package com.jhj.amado;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.product.ProductService;
import com.jhj.util.Pager;

@Controller
@RequestMapping(value = "product/*")
public class ProductController {
	@Inject
	private ProductService productService;

	@RequestMapping("shop")
	public void shop(Pager pager) throws Exception {
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
