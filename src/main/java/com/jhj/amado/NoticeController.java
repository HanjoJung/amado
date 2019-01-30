package com.jhj.amado;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.board.BoardDTO;
import com.jhj.notice.NoticeService;
import com.jhj.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Inject
	private NoticeService noticeService;

	@RequestMapping(value = "noticeList")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = noticeService.list(pager);
		mv.addObject("board", "notice");
		mv.setViewName("board/boardList");
		return mv;
	}

	@RequestMapping(value = "noticeSelect")
	public ModelAndView select(int num) throws Exception {
		ModelAndView mv = noticeService.select(num);
		return mv;
	}

	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("board", "notice");
		return "board/boardWrite";
	}

	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	@ResponseBody
	public int write(BoardDTO boardDTO, HttpSession session) throws Exception {
		return noticeService.insert(boardDTO, session);
	}

	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public ModelAndView update(int num) throws Exception {
		System.out.println("get update");
		ModelAndView mv = noticeService.select(num);
		mv.setViewName("board/boardUpdate");
		return mv;
	}

	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int update(BoardDTO boardDTO, HttpSession session) throws Exception {
		return noticeService.update(boardDTO, session);
	}

	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	@ResponseBody
	public int delete(int num, HttpSession session) throws Exception {
		return noticeService.delete(num, session);
	}

}
