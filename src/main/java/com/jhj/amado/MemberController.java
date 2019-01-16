package com.jhj.amado;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.member.MemberDTO;
import com.jhj.member.MemberService;
import com.jhj.util.Pager;

@Controller
@RequestMapping(value = "member/*")
public class MemberController {

	@Inject
	private MemberService memberService;

	@RequestMapping("join")
	public void shop() throws Exception {
		System.out.println("join");
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView shop(MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println("join post");
		ModelAndView mv = memberService.join(memberDTO, session);
		mv.setViewName("redirect:/");
		return mv;
	}

	@RequestMapping("checkId")
	public ModelAndView checkId(String id) throws Exception {
		ModelAndView mv = memberService.checkId(id);
		mv.setViewName("common/result");
		return mv;
	}

	@RequestMapping("list")
	public ModelAndView product(Pager pager) throws Exception {
		ModelAndView mv = memberService.list(pager);
		mv.setViewName("member/list");
		return mv;
	}

	@RequestMapping("login")
	public void login() throws Exception {
		System.out.println("login");
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login(MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println("login post");
		ModelAndView mv = memberService.login(memberDTO, session);
		mv.setViewName("common/result");
		return mv;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("myInfo")
	public void myInfo() throws Exception {
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView update(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = memberService.update(memberDTO, session);
		mv.setViewName("redirect:/");
		return mv;
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView delete(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = memberService.delete(memberDTO, session);
		mv.setViewName("common/result");
		return mv;
	}
}
