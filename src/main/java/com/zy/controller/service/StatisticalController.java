package com.zy.controller.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zy.entity.department.ServiceInfo;
import com.zy.service.service.StatisticalService;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("service/statistical")
public class StatisticalController {

	@Resource
	private StatisticalService stservice;

	/**
	 * 
	 * @MethodName: statistical
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:38
	 */
	@RequestMapping("statistical")
	public String statistical() {
		return "service/statistical";
	}

	/**
	 * 
	 * @MethodName: selectMoney
	 * @return String
	 * @Description: TODO
	 * @date 2020-07-16 07:13:42
	 */
	@ResponseBody
	@RequestMapping("selectMoney")
	public String selectMoney() {
		List<ServiceInfo> slist = stservice.selectMoney();
		return JSON.toJSONString(slist);
	}

}
