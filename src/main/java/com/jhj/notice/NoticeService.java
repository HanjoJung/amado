package com.jhj.notice;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.board.BoardDTO;
import com.jhj.board.BoardService;
import com.jhj.util.Pager;

@Service
public class NoticeService implements BoardService {

	@Inject
	private NoticeDAO noticeDAO;

	@Override
	public ModelAndView list(Pager pager) throws Exception {
		int totalCount = noticeDAO.totalCount(pager);
		pager.makePage(totalCount);
		pager.makeRow();

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", noticeDAO.list(pager));
		mv.addObject("pager", pager);
		return mv;
	}

	@Override
	public ModelAndView select(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardDTO boardDTO = noticeDAO.select(num);
		if (boardDTO != null) {
			noticeDAO.hitUp(num);
			mv.addObject("dto", boardDTO);
			mv.setViewName("board/boardSelect");
		} else {
			mv.addObject("msg", "해당 글이 존재하지않습니다.");
			mv.setViewName("redirect:./noticeList");
		}
		return mv;
	}

	@Override
	public int insert(BoardDTO boardDTO, HttpSession session) throws Exception {
		return noticeDAO.insert(boardDTO);
	}

	@Override
	public int update(BoardDTO boardDTO, HttpSession session) throws Exception {
		return noticeDAO.update(boardDTO);
	}

	@Override
	public int delete(int num, HttpSession session) throws Exception {
		return noticeDAO.delete(num);
	}

}
