package com.jhj.board;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.jhj.util.Pager;

public interface BoardService {

	// list
	public ModelAndView list(Pager pager) throws Exception;

	// select
	public ModelAndView select(int num) throws Exception;

	// insert
	public int insert(BoardDTO boardDTO, HttpSession session) throws Exception;

	// update
	public int update(BoardDTO boardDTO, HttpSession session) throws Exception;

	// delete
	public int delete(int num, HttpSession session) throws Exception;

}
