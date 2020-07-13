package com.zy.service.personnel.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.personnel.CourierInfo;
import com.zy.entity.service.LogisticsInfo;
import com.zy.entity.service.OrderInfo;
import com.zy.mapper.personnel.CourierInfoMapper;
import com.zy.mapper.service.LogisticsInfoMapper;
import com.zy.mapper.service.OrderInfoMapper;
import com.zy.service.personnel.CourierService;

@Service
@Transactional
public class CourierServiceImpl implements CourierService{

	@Resource
	private CourierInfoMapper mapper;
	
	@Resource
	private LogisticsInfoMapper logisticsInfoMapper;
	
	@Resource
	private OrderInfoMapper oimapper;
	
	@Override
	public DataGridResult query(CourierInfo courierInfo) {
		DataGridResult rs = new DataGridResult();
		courierInfo.setPage((courierInfo.getPage() - 1) * courierInfo.getRows());
		rs.setRows(mapper.selectRowsList(courierInfo));
		rs.setTotal(mapper.count(courierInfo));
		return rs;
	}

	
	@Override
	public List<CourierInfo> courierInfoCombobox() {
		// TODO Auto-generated method stub
		return mapper.courierInfoCombobox();
	}


	@Override
	public int addCourierInfo(CourierInfo record, HttpSession session) {
		int res = mapper.insertSelective(record);
		return res;
	}


	@Override
	public CourierInfo checkid(Integer courierId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(courierId);
	}


	@Override
	public CourierInfo findById(Integer courierId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(courierId);
	}


	@Override
	public int editCourierInfo(CourierInfo record, HttpSession session) {
		// TODO Auto-generated method stub
		int res = mapper.updateByPrimaryKey(record);
		return res;
	}


	@Override
	public int remove(String courierInfoIds) {
		// TODO Auto-generated method stub
		int res = 0;
		String[] data = courierInfoIds.split(",");
		for (String courierId : data) {
			res += mapper.deleteByPrimaryKey(Integer.parseInt(courierId));
		}
		return res;
	}


	@Override
	public List<LogisticsInfo> ClogisticsIdCombobox() {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.ClogisticsIdCombobox();
	}


	@Override
	public int ClogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.ClogisticsInfoUpdate(logisticsInfoUpdate);
	}


	@Override
	public List<OrderInfo> selectOrderList() {
		// TODO Auto-generated method stub
		return oimapper.orderCombobox();
	}

}
