package com.jhj.review;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.util.Pager;

@Service
public class ReviewServise {
	@Inject
	private ReviewDAO reviewDAO;

	public ModelAndView list(String productCode, Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = reviewDAO.getCount(productCode);
		mv.addObject("reviewCount", result);
		pager.makePage(result);
		pager.makeRow();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productCode", productCode);
		map.put("pager", pager);
		List<ReviewDTO> list = reviewDAO.list(map);
		boolean next = true;
		if(pager.getLastRow() >= result) {
			next = false;
		}
		mv.addObject("next", next);
		mv.addObject("reviewList", list);
		return mv;
	}

	public String insert(ReviewDTO reviewDTO) throws Exception {
		int result = reviewDAO.insert(reviewDTO);
		String msg = "후기를 작성하지 못하였습니다";
		if(result > 0) {
			msg = "후기가 작성되었습니다";
		}
		return msg;
	}

	public String delete(int num) throws Exception {
		int result = reviewDAO.delete(num);
		String msg = "후기를 삭제하지 못하였습니다";
		if(result > 0) {
			msg = "후기가 삭제되었습니다";
		}
		return msg;
	}

}
