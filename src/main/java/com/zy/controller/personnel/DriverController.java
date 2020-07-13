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
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.service.personnel.DriverService;
import com.zy.utils.MsgUtil;

@Controller
@RequestMapping("personnel/driverInfo")
public class DriverController {

	@Resource
	private DriverService service;

	@RequestMapping("driverInfo")
	public String driverInfo() {
		return "personnel/driverInfo";
	}

	// 查询配送员
	@ResponseBody
	@RequestMapping("query")
	public String query(DriverInfo driverInfo) {
		DataGridResult rs = service.query(driverInfo);
		return JSON.toJSONString(rs);
	}

	@RequestMapping("driverAdd")
	public String driverAdd() {
		return "personnel/driverAdd";
	}

	@ResponseBody
	@RequestMapping("addDriverInfo")
	public String addDriverInfo(DriverInfo record, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.addDriverInfo(record, session);
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
	@RequestMapping("checkDriverid")
	public String checkDriverid(Integer driverId) {
		MsgUtil msg = new MsgUtil();
		DriverInfo driverInfo = service.checkid(driverId);
		if (driverInfo != null) {
			msg.setSuccess(true);
		} else {
			msg.setSuccess(false);
		}
		return JSON.toJSONString(msg);
	}

	@RequestMapping("driverEdit")
	public ModelAndView driverEdit(Integer driverId) {
		ModelAndView mav = new ModelAndView();
		DriverInfo driverInfo = service.findById(driverId);
		mav.setViewName("personnel/driverEdit");
		mav.addObject("driverInfo", driverInfo);
		return mav;
	}

	// 修改快递员信息
	@ResponseBody
	@RequestMapping("editDriverInfo")
	public String editDriverInfo(DriverInfo record, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.editDriverInfo(record, session);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + res + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	@ResponseBody
	@RequestMapping("remove")
	public String remove(String driverInfoIds) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.remove(driverInfoIds);
			msg.setSuccess(true);
			msg.setMessage("成功删除" + res + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	@RequestMapping("DlogisticsUpdate")
	public String DlogisticsUpdate() {
		return "personnel/DlogisticsUpdate";
	}

	@ResponseBody
	@RequestMapping("DlogisticsIdCombobox")
	public String DlogisticsIdCombobox() {
		List<OrderInfo> olist = service.selectOrderList();
		return JSON.toJSONString(olist);
	}

	@ResponseBody
	@RequestMapping("DlogisticsInfoUpdate")
	public String DlogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.DlogisticsInfoUpdate(logisticsInfoUpdate);
			msg.setSuccess(true);
			msg.setMessage("成功更新" + res + "物流信息");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
}
