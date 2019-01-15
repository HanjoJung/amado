package com.jhj.amado;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.member.MemberDTO;
import com.jhj.member.MemberService;

@Controller
@RequestMapping(value = "member/*")
public class MemberController {

	@Inject
	private MemberService memberService;

	@RequestMapping("join")
	public void shop() throws Exception {
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView shop(MemberDTO memberDTO, HttpSession session) throws Exception {
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
	public void product() throws Exception {
	}

	@RequestMapping("login")
	public void login() throws Exception {
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public void login(MemberDTO memberDTO) throws Exception {
	}

	@RequestMapping("logout")
	public void logout() throws Exception {
	}

	@RequestMapping("myInfo")
	public void myInfo() throws Exception {
	}

	@RequestMapping("update")
	public void update() throws Exception {
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void update(MemberDTO memberDTO) throws Exception {
	}

	@RequestMapping("delete")
	public void delete() throws Exception {
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public void delete(MemberDTO memberDTO) throws Exception {
	}
}
