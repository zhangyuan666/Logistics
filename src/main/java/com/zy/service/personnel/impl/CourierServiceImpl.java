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

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class CourierServiceImpl implements CourierService {

	@Resource
	private CourierInfoMapper mapper;

	@Resource
	private LogisticsInfoMapper logisticsInfoMapper;

	@Resource
	private OrderInfoMapper oimapper;

	/**
	 * 
	 * @MethodName: query
	 * @param courierInfo
	 * @return
	 * @see com.zy.service.personnel.CourierService#query(com.zy.entity.personnel.CourierInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:36
	 */
	@Override
	public DataGridResult query(CourierInfo courierInfo) {
		DataGridResult rs = new DataGridResult();
		courierInfo.setPage((courierInfo.getPage() - 1) * courierInfo.getRows());
		rs.setRows(mapper.selectRowsList(courierInfo));
		rs.setTotal(mapper.count(courierInfo));
		return rs;
	}

	/**
	 * 
	 * @MethodName: courierInfoCombobox
	 * @return
	 * @see com.zy.service.personnel.CourierService#courierInfoCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:39:39
	 */
	@Override
	public List<CourierInfo> courierInfoCombobox() {
		// TODO Auto-generated method stub
		return mapper.courierInfoCombobox();
	}

	/**
	 * 
	 * @MethodName: addCourierInfo
	 * @param record
	 * @param session
	 * @return
	 * @see com.zy.service.personnel.CourierService#addCourierInfo(com.zy.entity.personnel.CourierInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:42
	 */
	@Override
	public int addCourierInfo(CourierInfo record, HttpSession session) {
		int res = mapper.insertSelective(record);
		return res;
	}

	/**
	 * 
	 * @MethodName: checkid
	 * @param courierId
	 * @return
	 * @see com.zy.service.personnel.CourierService#checkid(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:47
	 */
	@Override
	public CourierInfo checkid(Integer courierId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(courierId);
	}

	/**
	 * 
	 * @MethodName: findById
	 * @param courierId
	 * @return
	 * @see com.zy.service.personnel.CourierService#findById(java.lang.Integer)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:50
	 */
	@Override
	public CourierInfo findById(Integer courierId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(courierId);
	}

	/**
	 * 
	 * @MethodName: editCourierInfo
	 * @param record
	 * @param session
	 * @return
	 * @see com.zy.service.personnel.CourierService#editCourierInfo(com.zy.entity.personnel.CourierInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:53
	 */
	@Override
	public int editCourierInfo(CourierInfo record, HttpSession session) {
		// TODO Auto-generated method stub
		int res = mapper.updateByPrimaryKey(record);
		return res;
	}

	/**
	 * 
	 * @MethodName: remove
	 * @param courierInfoIds
	 * @return
	 * @see com.zy.service.personnel.CourierService#remove(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:39:56
	 */
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

	/**
	 * 
	 * @MethodName: ClogisticsIdCombobox
	 * @return
	 * @see com.zy.service.personnel.CourierService#ClogisticsIdCombobox()
	 * @Description: TODO
	 * @date 2020-07-16 07:39:58
	 */
	@Override
	public List<LogisticsInfo> ClogisticsIdCombobox() {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.ClogisticsIdCombobox();
	}

	/**
	 * 
	 * @MethodName: ClogisticsInfoUpdate
	 * @param logisticsInfoUpdate
	 * @return
	 * @see com.zy.service.personnel.CourierService#ClogisticsInfoUpdate(com.zy.entity.service.LogisticsInfo)
	 * @Description: TODO
	 * @date 2020-07-16 07:40:01
	 */
	@Override
	public int ClogisticsInfoUpdate(LogisticsInfo logisticsInfoUpdate) {
		// TODO Auto-generated method stub
		return logisticsInfoMapper.ClogisticsInfoUpdate(logisticsInfoUpdate);
	}

	/**
	 * 
	 * @MethodName: selectOrderList
	 * @return
	 * @see com.zy.service.personnel.CourierService#selectOrderList()
	 * @Description: TODO
	 * @date 2020-07-16 07:40:05
	 */
	@Override
	public List<OrderInfo> selectOrderList() {
		// TODO Auto-generated method stub
		return oimapper.orderCombobox();
	}

}
