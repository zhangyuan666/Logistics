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

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("system/auth")
public class AuthController {
	@Resource
	private AuthService service;

	/**
	 * 
	 * @MethodName: auth
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:56
	 */
	@RequestMapping("auth")
	public String auth() {
		return "system/auth";
	}

	/**
	 * 
	 * @MethodName: query
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:59
	 */
	@ResponseBody
	@RequestMapping("query")
	public String query() {
		List<Auth> list = service.query();
		return JSON.toJSONString(list);
	}

	/**
	 * 
	 * @MethodName: authAdd
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:14:02
	 */
	@RequestMapping("authAdd")
	public String authAdd() {
		return "system/authAdd";
	}

	/**
	 * 
	 * @MethodName: authEdit
	 * @param id
	 * @return ModelAndView
	 * @Description: TODO
	 * @date 2020-07-16 07:14:04
	 */
	@RequestMapping("authEdit")
	public ModelAndView authEdit(Integer id) {
		ModelAndView mav = new ModelAndView();
		Auth auth = service.selectByPrimaryKey(id);
		mav.setViewName("system/authEdit");
		mav.addObject("auth", auth);
		return mav;
	}

	/**
	 * 
	 * @MethodName: addAuth
	 * @param auth
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:14:07
	 */
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

	/**
	 * 
	 * @MethodName: combotree
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:14:10
	 */
	@ResponseBody
	@RequestMapping("combotree")
	public String combotree() {
		List<TreeNode> tree = service.combotree();
		return JSON.toJSONString(tree);
	}

	/**
	 * 
	 * @MethodName: editAuth
	 * @param auth
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:14:13
	 */
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

	/**
	 * 
	 * @MethodName: remove
	 * @param id
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:14:16
	 */
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
