package com.jhj.amado;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.review.ReviewDTO;
import com.jhj.review.ReviewServise;
import com.jhj.util.Pager;

@Controller
@RequestMapping(value = "review/*")
public class ReviewController {
	@Inject
	private ReviewServise reviewService;

	@RequestMapping("list")
	public ModelAndView list(String productCode, Pager pager) throws Exception {
		ModelAndView mv = reviewService.list(productCode, pager);
		mv.setViewName("product/review");
		return mv;
	}

	@RequestMapping("insert")
	public ModelAndView insert(ReviewDTO reviewDTO) throws Exception {
		ModelAndView mv = reviewService.insert(reviewDTO);
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(int num) throws Exception {
		ModelAndView mv = reviewService.delete(num);
		mv.setViewName("common/result");
		return mv;
	}
}
