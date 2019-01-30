package com.jhj.amado;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhj.board.BoardDTO;
import com.jhj.qna.QnaDTO;
import com.jhj.qna.QnaService;
import com.jhj.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Inject
	private QnaService qnaService;
/*
	// list
	@RequestMapping(value = "qnaList")
	public ModelAndView list(Model model, Pager pager) throws Exception {
		ModelAndView mv = qnaService.list(pager);
		mv.addObject("board", "qna");
		return mv;
	}

	// select
	@RequestMapping(value = "qnaSelect")
	public ModelAndView select(Model model, int num, RedirectAttributes rd) throws Exception {
		ModelAndView mv = qnaService.select(num);
		mv.addObject("board", "qna");
		return mv;
	}

	// write Form
	@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
	public String write(Model model) {
		model.addAttribute("board", "qna");
		return "board/boardWrite";
	}

	// write process
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView write(BoardDTO boardDTO, HttpSession session) throws Exception {
//		ModelAndView mv = qnaService.insert(boardDTO,session);
//		mv.addObject("board", "qna");
		return null;
	}

	// update Form
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ModelAndView update(Model model, int num) throws Exception {
		ModelAndView mv = qnaService.select(num);
		mv.setViewName("board/boardUpdate");
		mv.addObject("board", "qna");
		return mv;
	}

	// update process
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView update(BoardDTO boardDTO, HttpSession session) throws Exception {
//		ModelAndView mv = qnaService.update(boardDTO, session);
//		mv.setViewName("redirect:./qnaSelect?num=" + boardDTO.getNum());
//		mv.addObject("board", "qna");

		return null;
	}

	// delete process
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public ModelAndView delete(int num, HttpSession session) throws Exception {
//		ModelAndView mv = qnaService.delete(num, session);
//		mv.setViewName("redirect:./qnaList");
//		mv.addObject("board", "qna");

		return null;
	}

	// reply Form
	@RequestMapping(value = "qnaReply", method = RequestMethod.GET)
	public String reply(Model model, int num) {
		model.addAttribute("board", "qna");
		model.addAttribute("num", num);
		return "board/boardReply";
	}

	// reply process
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	public ModelAndView reply(QnaDTO qnaDTO, List<MultipartFile> f1, HttpSession session) throws Exception {
		ModelAndView mv = qnaService.reply(qnaDTO, f1, session);
		return mv;
	}
*/
}
