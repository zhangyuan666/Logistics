package com.zy.controller.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zy.entity.easyui.TreeNode;
import com.zy.entity.system.Auth;
import com.zy.service.system.AuthService;
import com.zy.utils.MsgUtil;

@Controller
@RequestMapping("system/auth")
public class AuthController {
	@Resource
	private AuthService service;

	@RequestMapping("auth")
	public String auth() {
		return "system/auth";
	}

	@ResponseBody
	@RequestMapping("query")
	public String query() {
		List<Auth> list =service.query();
		return JSON.toJSONString(list);
	}
	
	
	@RequestMapping("authAdd")
	public String authAdd() {
		return "system/authAdd";
	}
	
	@RequestMapping("authEdit")
	public ModelAndView authEdit(Integer id) {
		ModelAndView mav = new ModelAndView();
		Auth auth =	service.selectByPrimaryKey(id);
		mav.setViewName("system/authEdit");
		mav.addObject("auth",auth);
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping("addAuth")
	public String addAuth(Auth auth) {
		MsgUtil msg = new MsgUtil();
		try {
			int count = service.add(auth);
			msg.setSuccess(true);
			msg.setMessage("成功新增" + count + "条数据");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	
	
	@ResponseBody
	@RequestMapping("combotree")
	public String combotree() {
		List<TreeNode> tree = service.combotree();
		return JSON.toJSONString(tree);
	}
	
	@ResponseBody
	@RequestMapping("editAuth")
	public String editAuth(Auth auth) {
		MsgUtil msg = new MsgUtil();
		try {
			int count = service.editAuth(auth);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + count + "条数据");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	
	
	@ResponseBody
	@RequestMapping("remove")
	public String remove(Integer id) {
		MsgUtil msg = new MsgUtil();
		try {
			int count = service.remove(id);
			msg.setSuccess(true);
			msg.setMessage("成功删除 " + count + "条数据");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage("请先删除子项目！");
		}
		return JSON.toJSONString(msg);
	}
}
