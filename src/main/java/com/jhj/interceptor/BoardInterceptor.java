package com.jhj.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhj.member.MemberDTO;

public class BoardInterceptor extends HandlerInterceptorAdapter {

	// Controller 진입전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// return이 ture면 controller로 전송
		// false라면 controller 이동 안함

		HttpSession session = request.getSession();
		boolean check = false;

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String writer = (String) request.getParameter("writer");

		if (memberDTO != null && memberDTO.getId().equals(writer) || memberDTO.getId().equals("manager")) {
			check = true;
		} else {
			response.sendRedirect("../member/login?msg=" + URLEncoder.encode("작성자만 접근할 수 있습니다.", "UTF-8"));
		}
		return check;
	}

}
