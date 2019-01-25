package com.jhj.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhj.board.BoardDTO;
import com.jhj.member.MemberDTO;

public class BoardInterceptor extends HandlerInterceptorAdapter {

	// Controller 진입전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// return이 ture면 controller로 전송
		// false라면 controller 이동 안함

		System.out.println("pre Handle");
		HttpSession session = request.getSession();
		boolean check = true;
		if (session.getAttribute("member") != null) {
			check = true;
		}/* else {
			response.sendRedirect("../member/login");
		}*/
		return check;
	}

	// Controller를 완료 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String m = request.getMethod();
		if (m.equals("GET")) {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

			Map<String, Object> map = modelAndView.getModel();
			BoardDTO boardDTO = (BoardDTO) map.get("dto");

			if ( memberDTO == null || !memberDTO.getId().equals(boardDTO.getWriter())) {
				String board = (String) map.get("board");
				modelAndView.setViewName("redirect:./" + board + "List");
			}
		}

		System.out.println("post Handle");
		String viewName = modelAndView.getViewName();
		System.out.println("view Name" + viewName);
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		super.afterCompletion(request, response, handler, ex);
	}
}
