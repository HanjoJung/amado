package com.jhj.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jhj.util.Pager;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;

	public ModelAndView list(Pager pager) throws Exception {
		int totalCount = memberDAO.getCount();
		pager.makeRow();
		pager.makePage(totalCount);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", memberDAO.list(pager));
		mv.addObject("count", totalCount);
		return mv;
	}

	public String checkId(MemberDTO memberDTO) throws Exception {
		int result = memberDAO.checkId(memberDTO);
		String str = "";
		if (result > 0) {
			str = "이미 존제하는 아이디입니다.";
		}
		return str;
	}

	public int rewordPassword(MemberDTO memberDTO) throws Exception {
		return memberDAO.checkId(memberDTO);
	}

	public String login(MemberDTO memberDTO, HttpSession session) throws Exception {
		String kakao = memberDTO.getKakao();
		String facebook = memberDTO.getFacebook();
		memberDTO = memberDAO.selectOne(memberDTO);
		String str = "로그인에 실패했습니다";
		if (memberDTO != null) {
			memberDTO.setKakao(kakao);
			memberDTO.setFacebook(facebook);
			memberDAO.update(memberDTO);
			session.setAttribute("member", memberDTO);
			str = "로그인 됐습니다.";
		} else {
			throw new Exception();
		}
		return str;
	}

	public int selectOne(MemberDTO memberDTO) throws Exception {
		return memberDAO.checkId(memberDTO);
	}

	public ModelAndView join(MemberDTO memberDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String msg = "가입하지 못하였습니다.";
		int result = memberDAO.join(memberDTO);
		if (result > 0) {
			session.setAttribute("member", memberDTO);
			msg = "amado에 가입하신걸 환영합니다." + memberDTO.getName() + "님";
		}
		mv.addObject("msg", msg);
		return mv;
	}

	public String update(MemberDTO memberDTO, HttpSession session) throws Exception {
		String msg = "수정하지 못하였습니다.";
		int result = memberDAO.update(memberDTO);
		if (result > 0) {
			msg = "수정 되었습니다.";
			if (memberDTO.getPassword() == null) {
				session.setAttribute("member", memberDTO);
			}
		}
		return msg;
	}

	public String delete(MemberDTO memberDTO, HttpSession session) throws Exception {
		String msg = "탈퇴하지 못하였습니다.";
		int result = memberDAO.delete(memberDTO);
		if (result > 0) {
			msg = "탈퇴 되었습니다.";
			session.invalidate();
		}
		return msg;
	}
}
