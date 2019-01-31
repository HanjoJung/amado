package com.jhj.amado;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	@RequestMapping(value = "*/layout/header")
	public String header() {
		return "layout/header";
	}

	@RequestMapping(value = "*/layout/head")
	public String head() {
		return "layout/head";
	}

	@RequestMapping(value = "*/layout/footer")
	public String footer() {
		return "layout/footer";
	}

	@RequestMapping(value = "/kakao")
	public void kakao() {
	}

	@RequestMapping(value = "/facebook")
	public void facebook() {
	}

	@RequestMapping(value = "/map")
	public void map() {
	}

	@RequestMapping(value = "/test")
	public void test(HttpServletRequest request, HttpServletResponse response) {
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

			HttpSession session = request.getSession();
			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.

			session.setAttribute("__rsaPrivateKey__", privateKey);

			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

			request.setAttribute("publicKeyModulus", publicKeyModulus);
			request.setAttribute("publicKeyExponent", publicKeyExponent);

			request.getRequestDispatcher("/WEB-INF/views/test.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public void test(String securedUsername, String securedPassword, HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		System.out.println("securedUsername : " + securedUsername);
		System.out.println("securedPassword : " + securedPassword);

		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__");

		if (privateKey == null) {
			throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		}
		try {
			String username = decryptRsa(privateKey, securedUsername);
			String password = decryptRsa(privateKey, securedPassword);
			System.out.println("username : " + username);
			System.out.println("password : " + password);
			request.setAttribute("username", username);
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
