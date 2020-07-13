package com.zy.controller.system;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.system.Role;
import com.zy.entity.system.User;
import com.zy.entity.system.User_Role;
import com.zy.service.system.UserService;
import com.zy.utils.MsgUtil;

@Controller
@RequestMapping("system/user")
public class UserController {

	@Resource
	private UserService service;

	// 登录
	@ResponseBody
	@RequestMapping("login")
	public String login(String id, String password, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		User u = service.login(id, password);
		if (u != null)
			if (u.getStatus().equals("1")) {
				msg.setSuccess(false);
				msg.setMessage("账号已被冻结！");
			} else {
				msg.setSuccess(true);
				session.setAttribute("user", u);
			}
		else {
			msg.setSuccess(false);
			msg.setMessage("账号或密码错误！");
		}
		return JSON.toJSONString(msg);
	}

	// 退出系统
	@ResponseBody
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		MsgUtil msg = new MsgUtil();
		session.invalidate();
		msg.setSuccess(true);
		return JSON.toJSONString(msg);
	}

	// 修改密码
	@ResponseBody
	@RequestMapping("edit")
	public String edit(String oldpassword, String newpassword, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		Object obj = session.getAttribute("user");
		if (obj != null) {
			User u = (User) obj;
			try {
				int res = service.editpassword(u.getId(), oldpassword, newpassword);
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
			msg.setMessage("请先登录账号");
		}
		return JSON.toJSONString(msg);
	}

	// 跳转user
	@RequestMapping("user")
	public String user() {
		return "system/user";
	}

	// 查询用户
	@ResponseBody
	@RequestMapping("query")
	public String query(User user) {
		DataGridResult rs = service.query(user);
		return JSON.toJSONString(rs);
	}

	// 删除用户
	@ResponseBody
	@RequestMapping("remove")
	public String remove(String ids) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.remove(ids);
			msg.setSuccess(true);
			msg.setMessage("成功删除" + res + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	// 跳转userAdd
	@RequestMapping("userAdd")
	public String userAdd() {
		return "system/userAdd";
	}

	// 添加用户
	@ResponseBody
	@RequestMapping("addUser")
	public String addUser(User user, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.addUser(user, session);
			msg.setSuccess(true);
			msg.setMessage("成功新增" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	// 检查userid是否存在
	@ResponseBody
	@RequestMapping("checkUserid")
	public String checkUserid(String id) {
		MsgUtil msg = new MsgUtil();
		User user = service.checkid(id);
		if (user != null) {
			msg.setSuccess(true);
		} else {
			msg.setSuccess(false);
		}
		return JSON.toJSONString(msg);
	}

	// 重置密码
	@ResponseBody
	@RequestMapping("resetPwd")
	public String resetPwd(String ids) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.resetPwd(ids);
			msg.setSuccess(true);
			msg.setMessage("成功重置" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	// userEdit跳转携带user
	@RequestMapping("userEdit")
	public ModelAndView userEdit(String id) {
		ModelAndView mav = new ModelAndView();
		User u = service.checkid(id);
		mav.setViewName("system/userEdit");
		mav.addObject("u", u);
		return mav;
	}

	// 修改信息
	@ResponseBody
	@RequestMapping("editUser")
	public String editUser(User user, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.editUser(user, session);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	@ResponseBody
	@RequestMapping("roleCombobox")
	public String roleCombobox() {
		List<Role> list = service.roleCombobox();
		return JSON.toJSONString(list);
	}

	@ResponseBody
	@RequestMapping("setValues")
	public String setValues(String id) {
		List<User_Role> res = service.setValues(id);
		return JSON.toJSONString(res);
	}

	@RequestMapping("userImp")
	public String userImp() {
		return "system/userImp";
	}

	@ResponseBody
	@RequestMapping("imp")
	public String imp(MultipartFile userFile, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.imp(userFile, session);
			msg.setSuccess(true);
			msg.setMessage("成功导入" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	// pageHelper测试
	@ResponseBody
	@RequestMapping("test")
	public String pageHelperTest() {
		List<User> list = service.list();
		return JSON.toJSONString(list);
	}

}
