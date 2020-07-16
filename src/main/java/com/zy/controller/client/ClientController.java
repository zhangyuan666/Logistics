package com.zy.controller.client;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zy.entity.client.UserInfo;
import com.zy.entity.client.UserLogin;
import com.zy.service.client.ClientService;
import com.zy.service.client.DingDanService;
import com.zy.utils.MsgUtil;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("client/user")
public class ClientController {
	@Autowired
	private DingDanService dingDanService;
	@Resource
	private ClientService service;

	/**
	 * 
	 * @MethodName: login
	 * @param id
	 * @param password
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:06:02
	 */
	// 登录
	@ResponseBody
	@RequestMapping("login")
	public String login(String id, String password, HttpSession session) {
		System.out.println(id + " " + password);
		MsgUtil msg = new MsgUtil();
		UserLogin u = service.login(id, password);

		if (u != null) {
			UserInfo userinfo = dingDanService.selectUserInfo(u.getUserId());
			msg.setSuccess(true);
			session.setAttribute("userlogin", u);
			session.setAttribute("wuliu", userinfo);
		} else {
			msg.setSuccess(false);
			msg.setMessage("账号或密码错误！");
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: addUser
	 * @param user
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:06:41
	 */
	// 注册
	@ResponseBody
	@RequestMapping("addUser")
	public String addUser(UserLogin user, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			service.addUser(user, session);
			msg.setSuccess(true);
			msg.setMessage("注册成功！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}

		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: edit
	 * @param oldpassword
	 * @param newpassword
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:06:46
	 */
	// 修改密码
	@ResponseBody
	@RequestMapping("edit")
	public String edit(String oldpassword, String newpassword, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		Object obj = session.getAttribute("userlogin");
		if (obj != null) {
			UserLogin u = (UserLogin) obj;
			try {
				int res = service.editpassword(u.getUserId(), oldpassword, newpassword);
				if (res == 1) {
					msg.setSuccess(true);
					msg.setMessage("修改成功！");
				} else {
					msg.setSuccess(false);
					msg.setMessage("原密码不正确！");
				}
			} catch (Exception e) {
				msg.setSuccess(false);
				msg.setMessage(e.getMessage());
			}
		} else {
			msg.setSuccess(false);
			msg.setMessage("账号不存在");
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: find
	 * @param id
	 * @param newpassword
	 * @param userTel
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:06:50
	 */
	// 找回密码
	@ResponseBody
	@RequestMapping("find")
	public String find(String id, String newpassword, String userTel, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		Object obj = service.selectone(id);
		System.out.println(obj);
		if (obj != null) {
			try {
				int res = service.findpassword(id, userTel, newpassword);
				if (res == 1) {
					msg.setSuccess(true);
					msg.setMessage("修改成功！");
				} else {
					msg.setSuccess(false);
					msg.setMessage("手机号不正确！");
				}
			} catch (Exception e) {
				msg.setSuccess(false);
				msg.setMessage(e.getMessage());
			}
		} else {
			msg.setSuccess(false);
			msg.setMessage("账号不存在");
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: editUser
	 * @param user
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:06:54
	 */
	// 修改信息
	@ResponseBody
	@RequestMapping("editUser")
	public String editUser(UserInfo user, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		Object obj = session.getAttribute("userinfo");
		Object obj1 = session.getAttribute("userlogin");
		UserLogin userLogin = (UserLogin) obj1;
		user.setUserId(userLogin.getUserId());
		try {
			if (obj != null) {
				UserInfo userInfo = (UserInfo) obj;
				user.setUserInfoId(userInfo.getUserInfoId());
				int res = service.editUser(user, session);
				msg.setSuccess(true);
				msg.setMessage("成功修改" + res + "条数据！");
				session.setAttribute("wuliu", user);
			} else {
				int res = service.insertUser(user, session);
				msg.setSuccess(true);
				msg.setMessage("成功添加" + res + "条数据！");
				session.setAttribute("wuliu", user);
			}

		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

}
