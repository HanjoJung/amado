package com.jhj.amado;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	@ResponseBody
	public String insert(ReviewDTO reviewDTO) throws Exception {
		return reviewService.insert(reviewDTO);
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(int num) throws Exception {
		return reviewService.delete(num);
	}
}
