package com.zy.controller.personnel;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.service.personnel.CourierService;
import com.zy.utils.MsgUtil;

@Controller
@RequestMapping("personnel/courierInfo")
public class CourierController {
	
	@Resource
	private CourierService service;
	
	@RequestMapping("courierInfo")
	public String courierInfo() {
		return "personnel/courierInfo";
	}
	
	//查询快递员
	@ResponseBody
	@RequestMapping("query")
	public String query(CourierInfo courierInfo) {
		DataGridResult rs = service.query(courierInfo);
		return JSON.toJSONString(rs);
	}
	
	//跳转courierAdd
	@RequestMapping("courierAdd")
	public String courierAdd() {
		return "personnel/courierAdd";
	}
	
	//添加快递员
	@ResponseBody
	@RequestMapping("addCourierInfo")
	public String addCourierInfo(CourierInfo record, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.addCourierInfo(record, session);
			msg.setSuccess(true);
			msg.setMessage("成功新增" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	//检查userid是否存在
	@ResponseBody
	@RequestMapping("checkCourierid")
	public String checkCourierid(Integer courierId) {
		MsgUtil msg = new MsgUtil();
		CourierInfo courierInfo = service.checkid(courierId);
		if (courierInfo != null) {
			msg.setSuccess(true);
		} else {
			msg.setSuccess(false);
		}
		return JSON.toJSONString(msg);
	}
	
	
	//跳转courierEdit
	@RequestMapping("courierEdit")
	public ModelAndView courierEdit(Integer courierId) {
		ModelAndView mav = new ModelAndView();
		CourierInfo courierInfo = service.findById(courierId);
		mav.setViewName("personnel/courierEdit");
		mav.addObject("courierInfo", courierInfo);
		return mav;
		}
	
	//修改快递员信息
	@ResponseBody
	@RequestMapping("editCourierInfo")
	public String editCourierInfo(CourierInfo record,HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.editCourierInfo(record,session);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + res + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	
	//删除快递员信息
	@ResponseBody
	@RequestMapping("remove")
	public String remove(String courierInfoIds) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.remove(courierInfoIds);
			msg.setSuccess(true);
			msg.setMessage("成功删除" + res + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	
	@RequestMapping("ClogisticsUpdate")
	public String ClogisticsUpdate() {
		return "personnel/ClogisticsUpdate";
	}
	
	@ResponseBody
	@RequestMapping("ClogisticsIdCombobox")
	public String ClogisticsIdCombobox() {
		List<OrderInfo> olist = service.selectOrderList();
		return JSON.toJSONString(olist);
	}
	
	@ResponseBody
	@RequestMapping("ClogisticsInfoUpdate")
	public String ClogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.ClogisticsInfoUpdate(logisticsInfoUpdate);
			msg.setSuccess(true);
			msg.setMessage("成功更新" + res + "物流信息");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}	
}
