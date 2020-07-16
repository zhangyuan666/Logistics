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

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("personnel/courierInfo")
public class CourierController {

	@Resource
	private CourierService service;

	/**
	 * 
	 * @MethodName: courierInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:32
	 */
	@RequestMapping("courierInfo")
	public String courierInfo() {
		return "personnel/courierInfo";
	}

	/**
	 * 
	 * @MethodName: query
	 * @param courierInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:36
	 */
	// 查询快递员
	@ResponseBody
	@RequestMapping("query")
	public String query(CourierInfo courierInfo) {
		DataGridResult rs = service.query(courierInfo);
		return JSON.toJSONString(rs);
	}

	/**
	 * 
	 * @MethodName: courierAdd
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:39
	 */
	// 跳转courierAdd
	@RequestMapping("courierAdd")
	public String courierAdd() {
		return "personnel/courierAdd";
	}

	/**
	 * 
	 * @MethodName: addCourierInfo
	 * @param record
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:41
	 */
	// 添加快递员
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

	/**
	 * 
	 * @MethodName: checkCourierid
	 * @param courierId
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:45
	 */
	// 检查userid是否存在
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

	/**
	 * 
	 * @MethodName: courierEdit
	 * @param courierId
	 * @return ModelAndView
	 * @Description: TODO
	 * @date 2020-07-16 07:11:48
	 */
	// 跳转courierEdit
	@RequestMapping("courierEdit")
	public ModelAndView courierEdit(Integer courierId) {
		ModelAndView mav = new ModelAndView();
		CourierInfo courierInfo = service.findById(courierId);
		mav.setViewName("personnel/courierEdit");
		mav.addObject("courierInfo", courierInfo);
		return mav;
	}

	/**
	 * 
	 * @MethodName: editCourierInfo
	 * @param record
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:52
	 */
	// 修改快递员信息
	@ResponseBody
	@RequestMapping("editCourierInfo")
	public String editCourierInfo(CourierInfo record, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = service.editCourierInfo(record, session);
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
	 * @param courierInfoIds
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:56
	 */
	// 删除快递员信息
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

	/**
	 * 
	 * @MethodName: ClogisticsUpdate
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:59
	 */
	@RequestMapping("ClogisticsUpdate")
	public String ClogisticsUpdate() {
		return "personnel/ClogisticsUpdate";
	}

	/**
	 * 
	 * @MethodName: ClogisticsIdCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:02
	 */
	@ResponseBody
	@RequestMapping("ClogisticsIdCombobox")
	public String ClogisticsIdCombobox() {
		List<OrderInfo> olist = service.selectOrderList();
		return JSON.toJSONString(olist);
	}

	/**
	 * 
	 * @MethodName: ClogisticsInfoUpdate
	 * @param logisticsInfoUpdate
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:12:05
	 */
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
