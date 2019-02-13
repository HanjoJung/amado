package com.jhj.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.file.FileDAO;

@Repository
public class CartService {

	@Inject
	private CartDAO cartDAO;
	@Inject
	private FileDAO fileDAO;

	public int count(String id) throws Exception {
		return cartDAO.count(id);
	}

	public ModelAndView cartList(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CartDTO> list = cartDAO.list(id);
		for (CartDTO cartDTO : list) {
			cartDTO.setFile(fileDAO.list(cartDTO.getProductNum()));
		}
		mv.addObject("list", list);
		return mv;
	}

	public int check(CartDTO cartDTO) throws Exception {
		return cartDAO.check(cartDTO);
	}

	public String insert(CartDTO cartDTO) throws Exception {
		String str = "장바구니에 추가하지 못하였습니다.";
		int result = cartDAO.insert(cartDTO);
		if (result > 0) {
			str = "장바구니에 추가되었습니다.";
		}
		return str;
	}

	public ModelAndView delete(CartDTO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = cartDAO.delete(cartDTO);
		if (result > 0) {
			mv.addObject("msg", "장바구니에서 삭제되었습니다.");
		}
		return mv;
	}
}
