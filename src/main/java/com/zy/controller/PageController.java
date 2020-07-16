package com.zy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("page")
public class PageController {
	/**
	 * 
	 * @MethodName: login
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:29
	 */
	@RequestMapping("login")
	public String login() {
		return "login";
	}

	/**
	 * 
	 * @MethodName: index
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:32
	 */
	@RequestMapping("index")
	public String index() {
		return "index";
	}

	/**
	 * 
	 * @MethodName: south
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:35
	 */
	@RequestMapping("south")
	public String south() {
		return "/layout/south";
	}

	/**
	 * 
	 * @MethodName: center
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:38
	 */
	@RequestMapping("center")
	public String center() {
		return "/layout/center";
	}

	/**
	 * 
	 * @MethodName: north
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:42
	 */
	@RequestMapping("north")
	public String north() {
		return "/layout/north";
	}

	/**
	 * 
	 * @MethodName: west
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:46
	 */
	@RequestMapping("west")
	public String west() {
		return "/layout/west";
	}

	/**
	 * 
	 * @MethodName: edit
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:49
	 */
	@RequestMapping("edit")
	public String edit() {
		return "/layout/edit";
	}

	/**
	 * 
	 * @MethodName: noSession
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:52
	 */
	@RequestMapping("noSession")
	public String noSession() {
		return "/error/noSession";
	}

	/**
	 * 
	 * @MethodName: noAuth
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:16:57
	 */
	@RequestMapping("noAuth")
	public String noAuth() {
		return "/error/noAuth";
	}

	/**
	 * 
	 * @MethodName: forgotpassword
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:17:00
	 */
	@RequestMapping("forgotpassword")
	public String forgotpassword() {
		return "/client/forgot-password";
	}

	/**
	 * 
	 * @MethodName: register
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:17:03
	 */
	@RequestMapping("register")
	public String register() {
		return "/client/register";
	}

	/**
	 * 
	 * @MethodName: findpassword
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:17:06
	 */
	@RequestMapping("findpassword")
	public String findpassword() {
		return "/client/find-password";
	}

	/**
	 * 
	 * @MethodName: userlogin
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:17:09
	 */
	@RequestMapping("userlogin")
	public String userlogin() {
		return "/client/login";
	}

	/**
	 * 
	 * @MethodName: userinfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:17:12
	 */
	@RequestMapping("userinfo")
	public String userinfo() {
		return "/client/userinfo";
	}
}
