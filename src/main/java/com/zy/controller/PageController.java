package com.zy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("page")
public class PageController {

	@RequestMapping("login")
	public String login() {
		return "login";
	}

	@RequestMapping("index")
	public String index() {
		return "index";
	}

	@RequestMapping("south")
	public String south() {
		return "/layout/south";
	}

	@RequestMapping("center")
	public String center() {
		return "/layout/center";
	}

	@RequestMapping("north")
	public String north() {
		return "/layout/north";
	}

	@RequestMapping("west")
	public String west() {
		return "/layout/west";
	}

	@RequestMapping("edit")
	public String edit() {
		return "/layout/edit";
	}

	@RequestMapping("noSession")
	public String noSession() {
		return "/error/noSession";
	}
	
	@RequestMapping("noAuth")
	public String noAuth() {
		return "/error/noAuth";
	}
	
	@RequestMapping("forgotpassword")
	public String forgotpassword() {
		return "/client/forgot-password";
	}
	
	@RequestMapping("register")
	public String register() {
		return "/client/register";
	}
	
	@RequestMapping("findpassword")
	public String findpassword() {
		return "/client/find-password";
	}
	
	@RequestMapping("userlogin")
	public String userlogin() {
		return "/client/login";
	}
	
	@RequestMapping("userinfo")
	public String userinfo() {
		return "/client/userinfo";
	}
}
