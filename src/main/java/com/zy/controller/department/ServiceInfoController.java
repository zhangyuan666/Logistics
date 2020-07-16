package com.zy.controller.department;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zy.entity.department.ServiceInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.service.department.ServiceInfoService;
import com.zy.utils.MsgUtil;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("department/serviceInfo")
public class ServiceInfoController {
	@Resource
	private ServiceInfoService serviceInfoService;

	/**
	 * 
	 * @MethodName: station
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:08:38
	 */
	// 跳转serviceInfo
	@RequestMapping("serviceInfo")
	public String station() {
		return "department/serviceInfo";
	}

	/**
	 * 
	 * @MethodName: query
	 * @param serviceInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:08:41
	 */
	// 查询用户
	@ResponseBody
	@RequestMapping("query")
	public String query(ServiceInfo serviceInfo) {
		DataGridResult rs = serviceInfoService.query(serviceInfo);
		return JSON.toJSONString(rs);
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param serviceIds
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:08:45
	 */
	@ResponseBody
	@RequestMapping("remove")
	public String remove(String serviceIds) {
		MsgUtil msg = new MsgUtil();
		try {
			int count = serviceInfoService.remove(serviceIds);
			msg.setSuccess(true);
			msg.setMessage("成功删除" + count + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: serviceInfoAdd
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:08:49
	 */
	// 跳转serviceInfoAdd
	@RequestMapping("serviceInfoAdd")
	public String serviceInfoAdd() {
		return "department/serviceInfoAdd";
	}

	/**
	 * 
	 * @MethodName: addserviceInfo
	 * @param serviceInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:08:52
	 */
	// 添加服务点
	@ResponseBody
	@RequestMapping("addserviceInfo")
	public String addserviceInfo(ServiceInfo serviceInfo) {
		MsgUtil msg = new MsgUtil();
		try {
			int count = serviceInfoService.addserviceInfo(serviceInfo);
			msg.setSuccess(true);
			msg.setMessage("成功新增" + count + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: checkUserid
	 * @param serviceId
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:08:55
	 */
	// 检查ServiceId是否存在
	@ResponseBody
	@RequestMapping("checkServiceId")
	public String checkUserid(Integer serviceId) {
		MsgUtil msg = new MsgUtil();
		ServiceInfo serviceInfo = serviceInfoService.checkserviceId(serviceId);
		if (serviceInfo != null) {
			msg.setSuccess(true);
		} else {
			msg.setSuccess(false);
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: serviceInfoEdit
	 * @param serviceId
	 * @return ModelAndView
	 * @Description: TODO
	 * @date 2020-07-16 07:09:00
	 */
	// 跳转serviceInfoEdit
	@RequestMapping("serviceInfoEdit")
	public ModelAndView serviceInfoEdit(Integer serviceId) {
		ModelAndView mav = new ModelAndView();
		ServiceInfo serviceInfo = serviceInfoService.checkserviceId(serviceId);
		mav.setViewName("department/serviceInfoEdit");
		mav.addObject("serviceInfo", serviceInfo);
		return mav;
	}

	/**
	 * 
	 * @MethodName: editserviceInfo
	 * @param serviceInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:03
	 */
	// 修改服务点
	@ResponseBody
	@RequestMapping("editserviceInfo")
	public String editserviceInfo(ServiceInfo serviceInfo) {
		MsgUtil msg = new MsgUtil();
		try {
			int count = serviceInfoService.editserviceInfo(serviceInfo);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + count + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: serviceInfoDelivery
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:06
	 */
	// 跳转serviceInfoDelivery
	@RequestMapping("serviceInfoDelivery")
	public String serviceInfoDelivery() {
		return "department/serviceInfoDelivery";
	}

	/**
	 * 
	 * @MethodName: deliveryserviceInfo
	 * @param courierInfo
	 * @param orderId
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:10
	 */
	// 配送
	@ResponseBody
	@RequestMapping("deliveryserviceInfo")
	public String deliveryserviceInfo(CourierInfo courierInfo, String orderId) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = serviceInfoService.deliveryserviceInfo(courierInfo);
			serviceInfoService.updateOrder(orderId, courierInfo.getCourierId());
			msg.setSuccess(true);
			msg.setMessage("成功分配" + res + "条配送任务！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: courierCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:13
	 */
	@ResponseBody
	@RequestMapping("courierCombobox")
	public String courierCombobox() {
		List<CourierInfo> list = serviceInfoService.courierCombobox();
		return JSON.toJSONString(list);
	}

	/**
	 * 
	 * @MethodName: serviceInfoReceive
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:21
	 */
	// 跳转serviceInfoReceive
	@RequestMapping("serviceInfoReceive")
	public String serviceInfoReceive() {
		return "department/serviceInfoReceive";
	}

	/**
	 * 
	 * @MethodName: receiveserviceInfo
	 * @param courierInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:23
	 */
	// 揽件
	@ResponseBody
	@RequestMapping("receiveserviceInfo")
	public String receiveserviceInfo(CourierInfo courierInfo) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = serviceInfoService.receiveserviceInfo(courierInfo);
			msg.setSuccess(true);
			msg.setMessage("成功分配" + res + "条揽件数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: serviceInfoLogistics
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:27
	 */
	// 物流更新
	// 跳转serviceInfoLogistics
	@RequestMapping("serviceInfoLogistics")
	public String serviceInfoLogistics() {
		return "department/serviceInfoLogistics";
	}

	/**
	 * 
	 * @MethodName: logisticsserviceInfo
	 * @param orderInfo
	 * @param logisticsInfo
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:30
	 */
	// 物流更新
	@ResponseBody
	@RequestMapping("logisticsserviceInfo")
	public String logisticsserviceInfo(OrderInfo orderInfo, String logisticsInfo) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = serviceInfoService.logisticsserviceInfo(orderInfo, logisticsInfo);
			msg.setSuccess(true);
			msg.setMessage("成功更新" + res + "条物流信息！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: orderCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:34
	 */
	@ResponseBody
	@RequestMapping("orderCombobox")
	public String orderCombobox() {
		List<OrderInfo> list = serviceInfoService.orderCombobox();
		return JSON.toJSONString(list);
	}
}
