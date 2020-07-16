package com.zy.service.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.department.ServiceInfo;
import com.zy.mapper.department.ServiceInfoMapper;
import com.zy.service.service.StatisticalService;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class StatisticalServiceImpl implements StatisticalService {

	@Resource
	private ServiceInfoMapper smapper;

	/**
	 * 
	 * @MethodName: selectMoney
	 * @return
	 * @see com.zy.service.service.StatisticalService#selectMoney()
	 * @Description: TODO
	 * @date 2020-07-16 07:41:25
	 */
	@Override
	public List<ServiceInfo> selectMoney() {
		// TODO Auto-generated method stub
		return smapper.selectMoney();
	}

}
