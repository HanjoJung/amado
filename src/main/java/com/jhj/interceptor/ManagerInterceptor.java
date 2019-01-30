package com.jhj.interceptor;

import java.net.URLEncoder;

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
			response.sendRedirect("../member/login?msg="+ URLEncoder.encode("관리자 전용 페이지입니다.", "UTF-8"));
		}
		return check;
	}
}
