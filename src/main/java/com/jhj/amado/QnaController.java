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
import com.jhj.qna.QnaDTO;
import com.jhj.qna.QnaService;
import com.jhj.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Inject
	private QnaService qnaService;

	@RequestMapping(value = "qnaList")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = qnaService.list(pager);
		mv.setViewName("board/boardList");
		mv.addObject("board", "qna");
		return mv;
	}

	@RequestMapping(value = "qnaSelect")
	public ModelAndView select(int num) throws Exception {
		ModelAndView mv = qnaService.select(num);
		mv.addObject("board", "qna");
		return mv;
	}

	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("board", "qna");
		return "board/boardWrite";
	}

	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	@ResponseBody
	public int write(BoardDTO boardDTO, HttpSession session) throws Exception {
		return qnaService.insert(boardDTO, session);
	}

	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView update(int num) throws Exception {
		ModelAndView mv = qnaService.select(num);
		mv.setViewName("board/boardUpdate");
		mv.addObject("board", "qna");
		return mv;
	}

	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int update(BoardDTO boardDTO, HttpSession session) throws Exception {
		return qnaService.update(boardDTO, session);
	}

	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	@ResponseBody
	public int delete(int num, HttpSession session) throws Exception {
		return qnaService.delete(num, session);
	}

	@RequestMapping(value = "qnaReply", method = RequestMethod.GET)
	public String reply(Model model, int num) {
		model.addAttribute("board", "qna");
		model.addAttribute("num", num);
		return "board/boardReply";
	}

	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	@ResponseBody
	public int reply(QnaDTO qnaDTO, HttpSession session) throws Exception {
		return qnaService.reply(qnaDTO);
	}
}
