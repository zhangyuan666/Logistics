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

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("personnel/driverInfo")
public class DriverController {

	@Resource
	private DriverService service;

	/**
	 * 
	 * @MethodName: driverInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:25
	 */
	@RequestMapping("driverInfo")
	public String driverInfo() {
		return "personnel/driverInfo";
	}

	/**
	 * 
	 * @MethodName: query
	 * @param driverInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:28
	 */
	// 查询配送员
	@ResponseBody
	@RequestMapping("query")
	public String query(DriverInfo driverInfo) {
		DataGridResult rs = service.query(driverInfo);
		return JSON.toJSONString(rs);
	}

	/**
	 * 
	 * @MethodName: driverAdd
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:31
	 */
	@RequestMapping("driverAdd")
	public String driverAdd() {
		return "personnel/driverAdd";
	}

	/**
	 * 
	 * @MethodName: addDriverInfo
	 * @param record
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:34
	 */
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

	/**
	 * 
	 * @MethodName: checkDriverid
	 * @param driverId
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:37
	 */
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

	/**
	 * 
	 * @MethodName: driverEdit
	 * @param driverId
	 * @return ModelAndView
	 * @Description: TODO
	 * @date 2020-07-16 07:12:42
	 */
	@RequestMapping("driverEdit")
	public ModelAndView driverEdit(Integer driverId) {
		ModelAndView mav = new ModelAndView();
		DriverInfo driverInfo = service.findById(driverId);
		mav.setViewName("personnel/driverEdit");
		mav.addObject("driverInfo", driverInfo);
		return mav;
	}

	/**
	 * 
	 * @MethodName: editDriverInfo
	 * @param record
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:45
	 */
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

	/**
	 * 
	 * @MethodName: remove
	 * @param driverInfoIds
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:48
	 */
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

	/**
	 * 
	 * @MethodName: DlogisticsUpdate
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:51
	 */
	@RequestMapping("DlogisticsUpdate")
	public String DlogisticsUpdate() {
		return "personnel/DlogisticsUpdate";
	}

	/**
	 * 
	 * @MethodName: DlogisticsIdCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:54
	 */
	@ResponseBody
	@RequestMapping("DlogisticsIdCombobox")
	public String DlogisticsIdCombobox() {
		List<OrderInfo> olist = service.selectOrderList();
		return JSON.toJSONString(olist);
	}

	/**
	 * 
	 * @MethodName: DlogisticsInfoUpdate
	 * @param logisticsInfoUpdate
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:58
	 */
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
