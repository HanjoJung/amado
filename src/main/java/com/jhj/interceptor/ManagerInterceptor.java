package com.jhj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhj.member.MemberDTO;

public class ManagerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		boolean check = false;
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		if ( memberDTO != null && memberDTO.getName().equals("manager")) {
			check = true;
		} else {
			response.sendRedirect("../member/login");
		}
		return check;
	}
}
