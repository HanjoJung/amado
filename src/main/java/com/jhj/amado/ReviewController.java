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
@RequestMapping(value = "product/review/*")
public class ReviewController {
	@Inject
	private ReviewServise reviewService;

	@RequestMapping("list")
	public ModelAndView list(int productNum, Pager pager) throws Exception {
		ModelAndView mv = reviewService.list(productNum, pager);
		mv.setViewName("product/review");
		return mv;
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insert(ReviewDTO reviewDTO) throws Exception {
		reviewDTO.setContents(reviewDTO.getContents().replaceAll("\n", "<br>"));
		return reviewService.insert(reviewDTO);
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(int num) throws Exception {
		return reviewService.delete(num);
	}
}
