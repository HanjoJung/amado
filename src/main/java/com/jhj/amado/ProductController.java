package com.jhj.amado;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="product/*")
public class ProductController {
	
	@RequestMapping("shop")
	public void shop() throws Exception{}
	@RequestMapping("product")
	public void product() throws Exception{}
	@RequestMapping("cart")
	public void cart() throws Exception{}
	@RequestMapping("checkout")
	public void checkout() throws Exception{}
}
