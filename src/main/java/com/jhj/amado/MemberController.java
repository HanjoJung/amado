package com.jhj.amado;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public ModelAndView join(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv = rsa(session, mv);
		mv.setViewName("member/join");
		return mv;
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public ModelAndView join(MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println(memberDTO.getPassword());
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
	}

	@RequestMapping("loginForm")
	public ModelAndView loginForm(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv = rsa(session, mv);
		mv.setViewName("member/loginForm");
		return mv;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String login(MemberDTO memberDTO, HttpSession session) throws Exception {
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

	public ModelAndView rsa(HttpSession session, ModelAndView mv) {
		KeyPairGenerator generator;
		try {
			// RSA형식의 KeyPairGenerator를 가져온다
			generator = KeyPairGenerator.getInstance("RSA");
			// 키 크기를 1024 bit로 정한다
			generator.initialize(2048);

			// 키를 생성
			KeyPair keyPair = generator.generateKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");

			// 공개키를 가져온다
			PublicKey publicKey = keyPair.getPublic();
			// 개인키를 가져온다
			PrivateKey privateKey = keyPair.getPrivate();

			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
			session.setAttribute("__rsaPrivateKey__", privateKey);

			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

			mv.addObject("publicKeyModulus", publicKeyModulus);
			mv.addObject("publicKeyExponent", publicKeyExponent);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mv;
	}

	public void rsa(String securedPassword, HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		System.out.println("securedPassword : " + securedPassword);

		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__");

		if (privateKey == null) {
			throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		}
		try {
			String password = decryptRsa(privateKey, securedPassword);
			System.out.println("password : " + password);
			request.setAttribute("password", password);
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage(), ex);
		}
	}

	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		System.out.println("will decrypt : " + securedValue);
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] encryptedBytes = hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes, "utf-8");
		return decryptedValue;
	}

	public static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
		}

		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}
}
