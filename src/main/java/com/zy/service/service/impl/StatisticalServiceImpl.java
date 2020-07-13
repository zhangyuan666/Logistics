package com.zy.service.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.department.ServiceInfo;
import com.zy.mapper.department.ServiceInfoMapper;
import com.zy.service.service.StatisticalService;

@Service
@Transactional
public class StatisticalServiceImpl implements StatisticalService {

	
	@Resource
	private ServiceInfoMapper smapper;
	
	@Override
	public List<ServiceInfo> selectMoney() {
		// TODO Auto-generated method stub
		return smapper.selectMoney();
	}

}
