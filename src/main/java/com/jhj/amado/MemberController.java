package com.jhj.amado;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="member/*")
public class MemberController {
	
	@RequestMapping("join")
	public void shop() throws Exception{}
	@RequestMapping("list")
	public void product() throws Exception{}
	@RequestMapping("login")
	public void cart() throws Exception{}
	@RequestMapping("myInfo")
	public void checkout() throws Exception{}
}
