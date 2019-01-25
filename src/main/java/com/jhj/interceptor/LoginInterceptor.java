package com.jhj.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		boolean check = false;
		if (session.getAttribute("member") != null) {
			check = true;
		} else {
			response.sendRedirect("../member/login?msg="+ URLEncoder.encode("로그인 후 이용할 수 있습니다.", "UTF-8"));
		}
		return check;
	}
}
