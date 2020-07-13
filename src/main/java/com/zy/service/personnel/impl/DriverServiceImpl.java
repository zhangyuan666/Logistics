package com.zy.service.personnel.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.DriverInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.mapper.personnel.DriverInfoMapper;
import com.zy.mapper.service.LogisticsInfoMapper;
import com.zy.mapper.service.OrderInfoMapper;
import com.zy.service.personnel.DriverService;

@Service
@Transactional
public class DriverServiceImpl implements DriverService {

	@Resource
	private DriverInfoMapper mapper;

	@Resource
	private LogisticsInfoMapper logisticsInfoMapper;

	@Resource
	private OrderInfoMapper oimapper;

	@Override
	public DataGridResult query(DriverInfo driverInfo) {
		DataGridResult rs = new DataGridResult();
		driverInfo.setPage((driverInfo.getPage() - 1) * driverInfo.getRows());
		rs.setRows(mapper.selectRowsList(driverInfo));
		rs.setTotal(mapper.count(driverInfo));
		return rs;
	}

	@Override
	public int addDriverInfo(DriverInfo record, HttpSession session) {
		int res = mapper.insertSelective(record);
		return res;
	}

	@Override
	public DriverInfo checkid(Integer driverId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(driverId);
	}

	public List<DriverInfo> driverInfoCombobox() {
		// TODO Auto-generated method stub
		return mapper.driverInfoCombobox();
	}

	@Override
	public DriverInfo findById(Integer driverId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(driverId);
	}

	@Override
	public int editDriverInfo(DriverInfo record, HttpSession session) {
		// TODO Auto-generated method stub
		int res = mapper.updateByPrimaryKey(record);
		return res;
	}

	@Override
	public int remove(String driverInfoIds) {
		// TODO Auto-generated method stub
		int res = 0;
		String[] data = driverInfoIds.split(",");
		for (String driverId : data) {
			res += mapper.deleteByPrimaryKey(Integer.parseInt(driverId));
		}
		return res;
	}

	@Override
	public List<LogisticsInfo> DlogisticsIdCombobox() {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.DlogisticsIdCombobox();
	}

	@Override
	public int DlogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.DlogisticsInfoUpdate(logisticsInfoUpdate);
	}

	@Override
	public List<OrderInfo> selectOrderList() {
		// TODO Auto-generated method stub
		return oimapper.orderCombobox();
	}

}
