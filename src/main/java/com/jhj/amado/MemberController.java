package com.jhj.amado;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public void join() throws Exception {
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView join(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = memberService.join(memberDTO, session);
		mv.setViewName("redirect:/");
		return mv;
	}

	@RequestMapping(value = "checkId", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkId(MemberDTO memberDTO) throws Exception {
		return memberService.checkId(memberDTO);
	}

	@RequestMapping("list")
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = memberService.list(pager);
		mv.setViewName("member/list");
		return mv;
	}

	@RequestMapping("password")
	public void password() throws Exception {
	}
	
	@RequestMapping(value = "password", method = RequestMethod.POST)
	@ResponseBody
	public int password(MemberDTO memberDTO) throws Exception {
		return memberService.rewordPassword(memberDTO);
	}
	
	@RequestMapping("rewordPassword")
	public void rewordPassword() throws Exception {
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login() throws Exception {
		System.out.println("login get");
	}

	@RequestMapping("loginForm")
	public void loginForm() throws Exception {
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String login(MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println("login post");
		return memberService.login(memberDTO, session);
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("myInfo")
	public void myInfo() throws Exception {
	}

	@RequestMapping(value = "update", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String update(MemberDTO memberDTO, HttpSession session) throws Exception {
		return memberService.update(memberDTO, session);
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(MemberDTO memberDTO, HttpSession session) throws Exception {
		return memberService.delete(memberDTO, session);
	}
	
	@RequestMapping("manager")
	public void manager() throws Exception {
	}
}
