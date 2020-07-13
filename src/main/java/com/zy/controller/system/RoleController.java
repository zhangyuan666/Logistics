package com.zy.controller.system;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.system.Role;
import com.zy.service.system.RoleService;
import com.zy.utils.MsgUtil;

@Controller
@RequestMapping("system/role")
public class RoleController {

	@Resource
	private RoleService service;
	
	@RequestMapping("role")
	public String role() {
		return "system/role";
	}
	
	@RequestMapping("roleAdd")
	public String roleAdd() {
		return "system/roleAdd";
	}
	
	
	//添加用户
		@ResponseBody
		@RequestMapping("addRole")
		public String addRole(Role role, HttpSession session) {
			MsgUtil msg = new MsgUtil();
			try {
				int res = service.addRole(role, session);
				msg.setSuccess(true);
				msg.setMessage("成功新增" + res + "条数据！");
			} catch (Exception e) {
				msg.setSuccess(false);
				msg.setMessage(e.getMessage());
			}
			return JSON.toJSONString(msg);
		}
	
		@RequestMapping("roleEdit")
		public ModelAndView roleEdit(Integer id) {
			ModelAndView mav = new ModelAndView();
			Role role = service.findById(id);
			mav.setViewName("system/roleEdit");
			mav.addObject("role", role);
			return mav;
		}
		
		@ResponseBody
		@RequestMapping("editRole")
		public String editRole(Role role,HttpSession session) {
			MsgUtil msg = new MsgUtil();
			try {
				int res = service.editRole(role,session);
				msg.setSuccess(true);
				msg.setMessage("成功修改" + res + "数据！");
			} catch (Exception e) {
				msg.setSuccess(false);
				msg.setMessage(e.getMessage());
			}
			return JSON.toJSONString(msg);
		}
	
	
	@ResponseBody
	@RequestMapping("query")
	public String query(Role role) {
		DataGridResult rs = service.query(role);
		return JSON.toJSONString(rs);
	}
	
	
	@ResponseBody
	@RequestMapping("roleCombobox")
	public String roleCombobox() {
		List<Role> list = service.roleCombobox();
		return JSON.toJSONString(list);
	}
	
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
	
}
