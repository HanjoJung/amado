package com.jhj.amado;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.cart.CartDTO;
import com.jhj.cart.CartService;
import com.jhj.member.MemberDTO;

@Controller
@RequestMapping(value = "cart/*")
public class CartController {

	@Inject
	private CartService cartService;

	@RequestMapping("count")
	@ResponseBody
	public int count(String id) throws Exception {
		return cartService.count(id);
	}

	@RequestMapping("cartList")
	public ModelAndView list(HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		ModelAndView mv = cartService.cartList(memberDTO.getId());
		mv.setViewName("product/cartList");
		return mv;
	}

	@RequestMapping("check")
	@ResponseBody
	public int check(CartDTO cartDTO) throws Exception {
		return cartService.check(cartDTO);
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insert(CartDTO cartDTO) throws Exception {
		String str = cartService.insert(cartDTO);
		return str;
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView delete(CartDTO cartDTO) throws Exception {
		ModelAndView mv = cartService.delete(cartDTO);
		mv.setViewName("redirect:./list");
		return mv;
	}
}
