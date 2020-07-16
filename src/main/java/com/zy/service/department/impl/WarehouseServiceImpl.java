package com.zy.service.department.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.department.WarehouseInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.mapper.department.WarehouseInfoMapper;
import com.zy.mapper.personnel.CourierInfoMapper;
import com.zy.mapper.personnel.DriverInfoMapper;
import com.zy.mapper.service.LogisticsInfoMapper;
import com.zy.mapper.service.OrderInfoMapper;
import com.zy.service.department.WarehouseService;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class WarehouseServiceImpl implements WarehouseService {

	@Resource
	private WarehouseInfoMapper warehouseInfomapper;
	@Resource
	private DriverInfoMapper driverInfomapper;
	@Resource
	private CourierInfoMapper courierInfoMapper;
	@Resource
	private LogisticsInfoMapper logisticsInfoMapper;

	@Resource
	private OrderInfoMapper oimapper;

	/**
	 * 
	 * @MethodName: query
	 * @param record
	 * @return
	 * @see com.zy.service.department.WarehouseService#query(com.zy.entity.department.WarehouseInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:40
	 */
	// 查询
	@Override
	public DataGridResult query(WarehouseInfo record) {
		DataGridResult rs = new DataGridResult();
		// 分页公式封装
		record.setPage((record.getPage() - 1) * record.getRows());
		rs.setRows(warehouseInfomapper.selectRowsList(record));
		// 用Total是因为有分页，可能出现有300人却只显示10人
		rs.setTotal(warehouseInfomapper.count(record));
		return rs;
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param warehouseIds
	 * @return
	 * @see com.zy.service.department.WarehouseService#remove(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:42
	 */
	// 删除
	@Override
	@Transactional
	public int remove(String warehouseIds) {
		int res = 0;
		String[] data = warehouseIds.split(",");
		for (String warehouseId : data) {
			res += warehouseInfomapper.deleteByPrimaryKey(Integer.parseInt(warehouseId));
		}
		return res;
	}

	/**
	 * 
	 * @MethodName: addwarehouseInfo
	 * @param record
	 * @param session
	 * @return
	 * @see com.zy.service.department.WarehouseService#addwarehouseInfo(com.zy.entity.department.WarehouseInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:45
	 */
	// 添加仓库
	@Override
	public int addwarehouseInfo(WarehouseInfo record, HttpSession session) {
		int res = warehouseInfomapper.insertSelective(record);
		return res;
	}

	/**
	 * 
	 * @MethodName: checkWarehouseAddress
	 * @param warehouseAddress
	 * @return
	 * @see com.zy.service.department.WarehouseService#checkWarehouseAddress(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:49
	 */
	// 检查仓库地址是否存在
	@Override
	public WarehouseInfo checkWarehouseAddress(String warehouseAddress) {
		return warehouseInfomapper.selectByWarehouseAddress(warehouseAddress);
	}

	/**
	 * 
	 * @MethodName: checkwarehouseId
	 * @param warehouseId
	 * @return
	 * @see com.zy.service.department.WarehouseService#checkwarehouseId(int)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:52
	 */
	// 检查仓库ID是否存在
	@Override
	public WarehouseInfo checkwarehouseId(int warehouseId) {
		return warehouseInfomapper.selectByPrimaryKey(warehouseId);
	}

	/**
	 * 
	 * @MethodName: editWarehouse
	 * @param record
	 * @param session
	 * @return
	 * @see com.zy.service.department.WarehouseService#editWarehouse(com.zy.entity.department.WarehouseInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:38:54
	 */
	// 修改仓库信息
	@Override
	public int editWarehouse(WarehouseInfo record, HttpSession session) {
		return warehouseInfomapper.updateByPrimaryKeySelective(record);
	}

	/**
	 * 
	 * @MethodName: courierIdCombobox
	 * @return
	 * @see com.zy.service.department.WarehouseService#courierIdCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:38:57
	 */
	// 查快递员ID信息
	@Override
	public List<CourierInfo> courierIdCombobox() {
		return courierInfoMapper.courierIdCombobox();
	}

	/**
	 * 
	 * @MethodName: courierTask
	 * @param courierTask
	 * @return
	 * @see com.zy.service.department.WarehouseService#courierTask(com.zy.entity.personnel.CourierInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:00
	 */
	// 更新快递员任务
	@Override
	public int courierTask(CourierInfo courierTask) {
		return courierInfoMapper.courierTask(courierTask);
	}

	/**
	 * 
	 * @MethodName: driverIdCombobox
	 * @return
	 * @see com.zy.service.department.WarehouseService#driverIdCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:39:02
	 */
	// 查配送员ID信息
	@Override
	public List<DriverInfo> driverIdCombobox() {
		return driverInfomapper.driverIdCombobox();
	}

	/**
	 * 
	 * @MethodName: driverTask
	 * @param driverTask
	 * @return
	 * @see com.zy.service.department.WarehouseService#driverTask(com.zy.entity.personnel.DriverInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:06
	 */
	// 更新配送员任务
	@Override
	public int driverTask(DriverInfo driverTask) {
		return driverInfomapper.driverTask(driverTask);
	}

	/**
	 * 
	 * @MethodName: logisticsIdCombobox
	 * @return
	 * @see com.zy.service.department.WarehouseService#logisticsIdCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:39:10
	 */
	// 选择物流ID
	@Override
	public List<LogisticsInfo> logisticsIdCombobox() {
		return logisticsInfoMapper.logisticsIdCombobox();
	}

	/**
	 * 
	 * @MethodName: logisticsInfoUpdate
	 * @param logisticsInfoUpdate
	 * @return
	 * @see com.zy.service.department.WarehouseService#logisticsInfoUpdate(com.zy.entity.service.LogisticsInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:13
	 */
	// 更新物流信息
	@Override
	public int logisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		return logisticsInfoMapper.logisticsInfoUpdate(logisticsInfoUpdate);
	}

	/**
	 * 
	 * @MethodName: selectOrderList
	 * @return
	 * @see com.zy.service.department.WarehouseService#selectOrderList()
	 * @Description: TODO
	 * @date 2020-07-16 07:39:16
	 */
	@Override
	public List<OrderInfo> selectOrderList() {
		// TODO Auto-generated method stub
		return oimapper.orderCombobox();
	}

	/**
	 * 
	 * @MethodName: updateOrderDriver
	 * @param orderId
	 * @param driverId
	 * @return
	 * @see com.zy.service.department.WarehouseService#updateOrderDriver(java.lang.String,
	 *      java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:20
	 */
	@Override
	public int updateOrderDriver(String orderId, Integer driverId) {
		// TODO Auto-generated method stub
		return oimapper.updateOrderDriver(orderId, driverId);
	}
}
