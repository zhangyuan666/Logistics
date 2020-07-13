package com.zy.mapper.department;

import java.util.List;

import com.zy.entity.department.ServiceInfo;

public interface ServiceInfoMapper {
    int deleteByPrimaryKey(Integer serviceId);

    int insert(ServiceInfo record);

    int insertSelective(ServiceInfo record);

    ServiceInfo selectByPrimaryKey(Integer serviceId);

    int updateByPrimaryKeySelective(ServiceInfo record);

    int updateByPrimaryKey(ServiceInfo record);

    List<ServiceInfo> selectMoney();
    
    /*新增*/

   	List<Object> selectRowsList(ServiceInfo serviceInfo);

   	Long count(ServiceInfo serviceInfo);

   	void deleteByServiceInfoId(int parseInt);
   	
   	Integer selectByServiceName(String serviceName);
   	
   	


}