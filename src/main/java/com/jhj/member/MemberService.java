package com.jhj.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.util.Pager;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	public ModelAndView list(Pager pager) throws Exception {
		pager.makePage(memberDAO.getCount());
		pager.makeRow();
		ModelAndView mv = new ModelAndView();
		mv.addObject(memberDAO.list(pager));
		return mv;
	}

	public ModelAndView login(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject(memberDAO.login(memberDTO));
		return mv;
	}
	
	public ModelAndView selectOne(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject(memberDAO.selectOne(id));
		return mv;
	}

	public ModelAndView join(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		String msg = "가입하지 못하였습니다.";
		int result = memberDAO.join(memberDTO);
		if(result > 0) {
			msg = "amado에 가입하신걸 축하합니다.";
		}
		mv.addObject("msg", msg);
		return mv;
	}
	
	public ModelAndView checkId(String id) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = memberDAO.checkId(id);
		if(result == 1) {
			String str = "이미 존제하는 아이디입니다.";
			mv.addObject("msg", str);
		}
		return mv;
	}

	public ModelAndView update(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		String msg = "수정하지 못하였습니다";
		int result = memberDAO.update(memberDTO);
		if(result > 0) {
			msg = "수정 되었습니다";
		}
		mv.addObject("msg", msg);
		return mv;
	}

	public ModelAndView delete(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		String msg = "탈퇴하지 못하였습니다";
		int result = memberDAO.delete(memberDTO);
		if(result > 0) {
			msg = "탈퇴 되었습니다";
		}
		mv.addObject("msg", msg);
		return mv;
	}
}
