package com.zy.controller.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.service.service.OrderService;
import com.zy.utils.MsgUtil;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("service/order")
public class OrderController {

	@Resource
	private OrderService oservice;

	/**
	 * 
	 * @MethodName: order
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:13
	 */
	@RequestMapping("order")
	public String order() {
		return "service/order";
	}

	/**
	 * 
	 * @MethodName: query
	 * @param order
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:16
	 */
	@ResponseBody
	@RequestMapping("query")
	public String query(OrderInfo order) {
		DataGridResult rs = oservice.query(order);
		return JSON.toJSONString(rs);
	}

	/**
	 * 
	 * @MethodName: orderRemove
	 * @param ids
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:19
	 */
	@ResponseBody
	@RequestMapping("orderRemove")
	public String orderRemove(String ids) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = oservice.orderRemove(ids);
			msg.setSuccess(true);
			msg.setMessage("成功删除" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: orderEdit
	 * @param orderId
	 * @return ModelAndView
	 * @Description: TODO
	 * @date 2020-07-16 07:13:23
	 */
	@RequestMapping("orderEdit")
	public ModelAndView orderEdit(String orderId) {
		System.out.println(orderId);
		ModelAndView mav = new ModelAndView();
		OrderInfo order = oservice.selectOrderById(orderId);
		mav.setViewName("service/orderEdit");
		mav.addObject("order", order);
		List<CourierInfo> courlist = oservice.selectCourList();
		List<DriverInfo> driverlist = oservice.selectDriveList();
		mav.addObject("courlist", courlist);
		mav.addObject("driverlist", driverlist);
		return mav;
	}

	/**
	 * 
	 * @MethodName: editOrder
	 * @param orderId
	 * @param orderState
	 * @param driverId
	 * @param courierId
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:26
	 */
	@ResponseBody
	@RequestMapping("editOrder")
	public String editOrder(String orderId, Integer orderState, Integer driverId, Integer courierId) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = oservice.editOrder(orderId, orderState, driverId, courierId);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + res + "条订单！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

}
