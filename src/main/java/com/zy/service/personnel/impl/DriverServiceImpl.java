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

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class DriverServiceImpl implements DriverService {

	@Resource
	private DriverInfoMapper mapper;

	@Resource
	private LogisticsInfoMapper logisticsInfoMapper;

	@Resource
	private OrderInfoMapper oimapper;

	/**
	 * 
	 * @MethodName: query
	 * @param driverInfo
	 * @return
	 * @see com.zy.service.personnel.DriverService#query(com.zy.entity.personnel.DriverInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:16
	 */
	@Override
	public DataGridResult query(DriverInfo driverInfo) {
		DataGridResult rs = new DataGridResult();
		driverInfo.setPage((driverInfo.getPage() - 1) * driverInfo.getRows());
		rs.setRows(mapper.selectRowsList(driverInfo));
		rs.setTotal(mapper.count(driverInfo));
		return rs;
	}

	/**
	 * 
	 * @MethodName: addDriverInfo
	 * @param record
	 * @param session
	 * @return
	 * @see com.zy.service.personnel.DriverService#addDriverInfo(com.zy.entity.personnel.DriverInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:19
	 */
	@Override
	public int addDriverInfo(DriverInfo record, HttpSession session) {
		int res = mapper.insertSelective(record);
		return res;
	}

	/**
	 * 
	 * @MethodName: checkid
	 * @param driverId
	 * @return
	 * @see com.zy.service.personnel.DriverService#checkid(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:24
	 */
	@Override
	public DriverInfo checkid(Integer driverId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(driverId);
	}

	/**
	 * 
	 * @MethodName: driverInfoCombobox
	 * @return
	 * @see com.zy.service.personnel.DriverService#driverInfoCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:40:26
	 */
	public List<DriverInfo> driverInfoCombobox() {
		// TODO Auto-generated method stub
		return mapper.driverInfoCombobox();
	}

	/**
	 * 
	 * @MethodName: findById
	 * @param driverId
	 * @return
	 * @see com.zy.service.personnel.DriverService#findById(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:29
	 */
	@Override
	public DriverInfo findById(Integer driverId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(driverId);
	}

	/**
	 * 
	 * @MethodName: editDriverInfo
	 * @param record
	 * @param session
	 * @return
	 * @see com.zy.service.personnel.DriverService#editDriverInfo(com.zy.entity.personnel.DriverInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:32
	 */
	@Override
	public int editDriverInfo(DriverInfo record, HttpSession session) {
		// TODO Auto-generated method stub
		int res = mapper.updateByPrimaryKey(record);
		return res;
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param driverInfoIds
	 * @return
	 * @see com.zy.service.personnel.DriverService#remove(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:35
	 */
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

	/**
	 * 
	 * @MethodName: DlogisticsIdCombobox
	 * @return
	 * @see com.zy.service.personnel.DriverService#DlogisticsIdCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:40:38
	 */
	@Override
	public List<LogisticsInfo> DlogisticsIdCombobox() {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.DlogisticsIdCombobox();
	}

	/**
	 * 
	 * @MethodName: DlogisticsInfoUpdate
	 * @param logisticsInfoUpdate
	 * @return
	 * @see com.zy.service.personnel.DriverService#DlogisticsInfoUpdate(com.zy.entity.service.LogisticsInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:41
	 */
	@Override
	public int DlogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.DlogisticsInfoUpdate(logisticsInfoUpdate);
	}

	/**
	 * 
	 * @MethodName: selectOrderList
	 * @return
	 * @see com.zy.service.personnel.DriverService#selectOrderList()
	 * @Description: TODO
	 * @date 2020-07-16 07:40:44
	 */
	@Override
	public List<OrderInfo> selectOrderList() {
		// TODO Auto-generated method stub
		return oimapper.orderCombobox();
	}

}
