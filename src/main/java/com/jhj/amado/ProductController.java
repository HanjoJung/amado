package com.jhj.amado;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView shop() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("brand", this.brand);
		mv.addObject("category", this.category);
		return mv;
	}
	
	String[] brand = { "Amado", "Ikea", "marketb", "The factory", "Artdeco" };
	String[] category = { "chair", "beds", "furniture", "homeDeco", "table", "kid" };

	@RequestMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		if (pager.getCurPage() == 0) {
			pager.setCurPage(1);
		}
		pager.setPerPage(10);
		pager.setSearch("");
		ModelAndView mv = productService.list(pager);
		mv.setViewName("/product/list");
		return mv;
	}

	@RequestMapping("product_area")
	public ModelAndView product_area(Pager pager) throws Exception {
		ModelAndView mv = productService.list(pager);
		mv.setViewName("product/product_area");
		return mv;
	}

	@RequestMapping("select")
	public ModelAndView product(int productNum) throws Exception {
		return productService.selectOne(productNum);
	}

	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public ModelAndView insert() throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.addObject("brand", this.brand);
			mv.addObject("category", this.category);
			mv.setViewName("product/insert");
			return mv;
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView insert(ProductDTO productDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		ModelAndView mv = productService.insert(productDTO, f1, session);
		mv.setViewName("redirect:../member/manager");
		return mv;
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView update(int productNum) throws Exception {
		ModelAndView mv = productService.selectOne(productNum);
		mv.addObject("brand", this.brand);
		mv.addObject("category", this.category);
		mv.setViewName("product/update");
		return mv;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(ProductDTO productDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		ModelAndView mv = productService.update(productDTO, f1, session);
		mv.setViewName("product/update");
		return mv;
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(int productNum, HttpSession session) throws Exception {
		return productService.delete(productNum, session);
	}

	@RequestMapping("checkout")
	public void checkout() throws Exception {
	}

	@RequestMapping("latest")
	public ModelAndView list(HttpServletRequest request) throws Exception {
		ModelAndView mv = productService.latest(request);
		mv.setViewName("product/latest");
		return mv;
	}
}
