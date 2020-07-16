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

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("department/warehouse")
public class WarehouseController {
	@Resource
	private WarehouseService warehouseService;

	/**
	 * 
	 * @MethodName: warehouse
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:49
	 */
	// 跳转warehouse
	@RequestMapping("warehouse")
	public String warehouse() {
		return "department/warehouse";
	}

	/**
	 * 
	 * @MethodName: query
	 * @param record
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:52
	 */
	// 查询用户
	@ResponseBody
	@RequestMapping("query")
	public String query(WarehouseInfo record) {
		DataGridResult rs = warehouseService.query(record);
		return JSON.toJSONString(rs);
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param warehouseIds
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:09:56
	 */
	// 删除用户
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

	/**
	 * 
	 * @MethodName: warehouseAdd
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:26
	 */
	// 跳转添加仓库
	@RequestMapping("warehouseAdd")
	public String warehouseAdd() {
		return "department/warehouseAdd";
	}

	/**
	 * 
	 * @MethodName: addWarehouse
	 * @param record
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:30
	 */
	// 添加仓库
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

	/**
	 * 
	 * @MethodName: checkWarehouseAddress
	 * @param warehouseAddress
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:34
	 */
	// 检查WarehouseAddress是否存在
	@ResponseBody
	@RequestMapping("checkWarehouseAddress")
	public String checkWarehouseAddress(String warehouseAddress) {
		MsgUtil msg = new MsgUtil();
		WarehouseInfo record = warehouseService.checkWarehouseAddress(warehouseAddress);
		if (record != null) {
			msg.setSuccess(true);
		} else {
			msg.setSuccess(false);
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: warehouseEdit
	 * @param warehouseId
	 * @return ModelAndView
	 * @Description: TODO
	 * @date 2020-07-16 07:10:38
	 */
	// warehouseEdit跳转携带warehouse
	@RequestMapping("warehouseEdit")
	public ModelAndView warehouseEdit(int warehouseId) {
		ModelAndView mav = new ModelAndView();
		WarehouseInfo warehouseInfo = warehouseService.checkwarehouseId(warehouseId);
		mav.setViewName("department/warehouseEdit");
		mav.addObject("warehouseInfo", warehouseInfo);
		return mav;
	}

	/**
	 * 
	 * @MethodName: editWarehouse
	 * @param record
	 * @param session
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:42
	 */
	// 修改仓库信息
	@ResponseBody
	@RequestMapping("editWarehouse")
	public String editWarehouse(WarehouseInfo record, HttpSession session) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.editWarehouse(record, session);
			msg.setSuccess(true);
			msg.setMessage("成功修改" + res + "条数据！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: receiving
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:47
	 */
	// 跳转收货
	@RequestMapping("receiving")
	public String receiving() {
		return "department/receiving";
	}

	/**
	 * 
	 * @MethodName: courierIdCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:50
	 */
	// 选择快递员ID
	@ResponseBody
	@RequestMapping("courierIdCombobox")
	public String courierIdCombobox() {
		List<CourierInfo> courierList = warehouseService.courierIdCombobox();
		return JSON.toJSONString(courierList);
	}

	/**
	 * 
	 * @MethodName: courierTask
	 * @param courierTask
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:54
	 */
	// 快递员派送任务
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

	/**
	 * 
	 * @MethodName: shipment
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:10:59
	 */
	// 跳转仓库发货
	@RequestMapping("shipment")
	public String shipment() {
		return "department/shipment";
	}

	/**
	 * 
	 * @MethodName: driverTask
	 * @param driverTask
	 * @param orderId
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:02
	 */
	// 仓库派送任务
	@ResponseBody
	@RequestMapping("driverTask")
	public String driverTask(DriverInfo driverTask, String orderId) {
		MsgUtil msg = new MsgUtil();
		try {
			int res = warehouseService.driverTask(driverTask);
			warehouseService.updateOrderDriver(orderId, driverTask.getDriverId());
			msg.setSuccess(true);
			msg.setMessage("成功分配" + res + "条任务！");
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMessage(e.getMessage());
		}
		return JSON.toJSONString(msg);
	}

	/**
	 * 
	 * @MethodName: driverIdCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:06
	 */
	// 选择配送员ID
	@ResponseBody
	@RequestMapping("driverIdCombobox")
	public String driverIdCombobox() {
		List<DriverInfo> driverList = warehouseService.driverIdCombobox();
		return JSON.toJSONString(driverList);
	}

	/**
	 * 
	 * @MethodName: logisticsUpdate
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:09
	 */
	// 跳转订单状态(物流更新)
	@RequestMapping("logisticsUpdate")
	public String logisticsUpdate() {
		return "department/logisticsUpdate";
	}

	/**
	 * 
	 * @MethodName: logisticsIdCombobox
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:12
	 */
	// 选择订单ID
	@ResponseBody
	@RequestMapping("logisticsIdCombobox")
	public String logisticsIdCombobox() {
		List<OrderInfo> olist = warehouseService.selectOrderList();
		return JSON.toJSONString(olist);
	}

	/**
	 * 
	 * @MethodName: logisticsInfoUpdate
	 * @param logisticsInfoUpdate
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:11:15
	 */
	// 更新物流信息
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