package com.zy.controller.department;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSON;
import com.zy.entity.department.WarehouseInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.service.department.WarehouseService;
import com.zy.utils.MsgUtil;

@Controller
@RequestMapping("department/warehouse")
public class WarehouseController {
	@Resource
	private WarehouseService warehouseService;
	//跳转warehouse
	@RequestMapping("warehouse")
	public String warehouse() {
		return "department/warehouse";
	}
	//查询用户
	@ResponseBody
	@RequestMapping("query")
	public String query(WarehouseInfo record) {
		DataGridResult rs = warehouseService.query(record);
		return JSON.toJSONString(rs);
	}	
	//删除用户
	@ResponseBody
	@RequestMapping("remove")
	public String remove(String warehouseIds) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.remove(warehouseIds);
			msg.setSuccess(true);
			msg.setMessage("成功删除" + res + "数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	//跳转添加仓库
	@RequestMapping("warehouseAdd")
	public String warehouseAdd() {
		return "department/warehouseAdd";
	}
	//添加仓库
	@ResponseBody
	@RequestMapping("addWarehouse")
	public String addWarehouse(WarehouseInfo record, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.addwarehouseInfo(record, session);
			msg.setSuccess(true);
			msg.setMessage("成功新增" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	//检查WarehouseAddress是否存在
	@ResponseBody
	@RequestMapping("checkWarehouseAddress")
	public String checkWarehouseAddress(String warehouseAddress) {
		MsgUtil msg = new MsgUtil();
		WarehouseInfo record= warehouseService.checkWarehouseAddress(warehouseAddress);
		if (record != null) {
			msg.setSuccess(true);
		} else {
			msg.setSuccess(false);
		}
		return JSON.toJSONString(msg);
	}
	//warehouseEdit跳转携带warehouse
	@RequestMapping("warehouseEdit")
	public ModelAndView warehouseEdit(int warehouseId) {
		ModelAndView mav = new ModelAndView();
		WarehouseInfo warehouseInfo = warehouseService.checkwarehouseId(warehouseId);
		mav.setViewName("department/warehouseEdit");
		mav.addObject("warehouseInfo", warehouseInfo);
		return mav;
	}
	//修改仓库信息
	@ResponseBody
	@RequestMapping("editWarehouse")
	public String editWarehouse(WarehouseInfo record,HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.editWarehouse(record,session);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	//跳转收货
	@RequestMapping("receiving")
	public String receiving() {
		return "department/receiving";
	}
	//选择快递员ID
	@ResponseBody
	@RequestMapping("courierIdCombobox")
	public String courierIdCombobox() {
		List<CourierInfo> courierList = warehouseService.courierIdCombobox();
		return JSON.toJSONString(courierList);
	}
	//快递员派送任务
	@ResponseBody
	@RequestMapping("courierTask")
	public String courierTask(CourierInfo courierTask) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.courierTask(courierTask);
			msg.setSuccess(true);
			msg.setMessage("成功接收" + res + "个订单！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}	
	//跳转仓库发货
	@RequestMapping("shipment")
	public String shipment() {
		return "department/shipment";
	}
	//仓库派送任务
	@ResponseBody
	@RequestMapping("driverTask")
	public String driverTask(DriverInfo driverTask,String orderId) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.driverTask(driverTask);
			warehouseService.updateOrderDriver(orderId,driverTask.getDriverId());
			msg.setSuccess(true);
			msg.setMessage("成功分配" + res + "条任务！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}
	//选择配送员ID
	@ResponseBody
	@RequestMapping("driverIdCombobox")
	public String driverIdCombobox() {
		List<DriverInfo> driverList = warehouseService.driverIdCombobox();
		return JSON.toJSONString(driverList);
	}
	//跳转订单状态(物流更新)
	@RequestMapping("logisticsUpdate")
	public String logisticsUpdate() {
		return "department/logisticsUpdate";
	}
	//选择订单ID
	@ResponseBody
	@RequestMapping("logisticsIdCombobox")
	public String logisticsIdCombobox() {
		List<OrderInfo> olist = warehouseService.selectOrderList();
		return JSON.toJSONString(olist);
	}
	//更新物流信息
	@ResponseBody
	@RequestMapping("logisticsInfoUpdate")
	public String logisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.logisticsInfoUpdate(logisticsInfoUpdate);
			msg.setSuccess(true);
			msg.setMessage("成功更新" + res + "条物流信息！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}	
}