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

	// 添加仓库
	@Override
	public int addwarehouseInfo(WarehouseInfo record, HttpSession session) {
		int res = warehouseInfomapper.insertSelective(record);
		return res;
	}

	// 检查仓库地址是否存在
	@Override
	public WarehouseInfo checkWarehouseAddress(String warehouseAddress) {
		return warehouseInfomapper.selectByWarehouseAddress(warehouseAddress);
	}

	// 检查仓库ID是否存在
	@Override
	public WarehouseInfo checkwarehouseId(int warehouseId) {
		return warehouseInfomapper.selectByPrimaryKey(warehouseId);
	}

	// 修改仓库信息
	@Override
	public int editWarehouse(WarehouseInfo record, HttpSession session) {
		return warehouseInfomapper.updateByPrimaryKeySelective(record);
	}

	// 查快递员ID信息
	@Override
	public List<CourierInfo> courierIdCombobox() {
		return courierInfoMapper.courierIdCombobox();
	}

	// 更新快递员任务
	@Override
	public int courierTask(CourierInfo courierTask) {
		return courierInfoMapper.courierTask(courierTask);
	}

	// 查配送员ID信息
	@Override
	public List<DriverInfo> driverIdCombobox() {
		return driverInfomapper.driverIdCombobox();
	}

	// 更新配送员任务
	@Override
	public int driverTask(DriverInfo driverTask) {
		return driverInfomapper.driverTask(driverTask);
	}

	// 选择物流ID
	@Override
	public List<LogisticsInfo> logisticsIdCombobox() {
		return logisticsInfoMapper.logisticsIdCombobox();
	}

	// 更新物流信息
	@Override
	public int logisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		return logisticsInfoMapper.logisticsInfoUpdate(logisticsInfoUpdate);
	}

	@Override
	public List<OrderInfo> selectOrderList() {
		// TODO Auto-generated method stub
		return oimapper.orderCombobox();
	}
}
