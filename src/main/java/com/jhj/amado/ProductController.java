package com.jhj.amado;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.product.ProductDTO;
import com.jhj.product.ProductService;
import com.jhj.util.Pager;

@Controller
@RequestMapping(value="product/*")
public class ProductController {
	@Inject
	private ProductService productService;
	
	@RequestMapping("shop")
	public ModelAndView shop(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> list = productService.list(pager);
		mv.addObject(list);
		mv.setViewName("shop");
		return mv;
	}
	@RequestMapping("product")
	public void product() throws Exception{}
	@RequestMapping("cart")
	public void cart() throws Exception{}
	@RequestMapping("checkout")
	public void checkout() throws Exception{}
	@RequestMapping("wishList")
	public void wishList() throws Exception{}
	@RequestMapping("review")
	public void review() throws Exception{}
}
