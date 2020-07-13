package com.zy.service.client.impl;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.client.UserInfo;
import com.zy.entity.client.UserLogin;
import com.zy.mapper.client.UserInfoMapper;
import com.zy.mapper.client.UserLoginMapper;
import com.zy.service.client.ClientService;

import com.zy.utils.Md5Util;


@Service
@Transactional
public class ClientServiceImpl implements ClientService {
	
	@Resource
	private UserLoginMapper ulmapper;
	
	@Resource
	private UserInfoMapper uimapper;


	@Override
	public UserLogin login(String id, String password) {
		// TODO Auto-generated method stub
		UserLogin u = ulmapper.selectOne(id);
		if (u == null || !u.getUserPwd().equals(Md5Util.md5(password))) {
			u = null;
		      } 
		System.out.println(u);
		return u;
	}
	
	@Override
	public UserLogin selectone(String id) {
		// TODO Auto-generated method stub
		UserLogin u = ulmapper.selectOne(id);
		return u;
	}

	@Override
	public int editpassword(String id, String oldpassword, String newpassword) {
		return ulmapper.editpassword(id, Md5Util.md5(oldpassword), Md5Util.md5(newpassword));
	}
	
	@Override
	public int findpassword(String id, String userTel, String newpassword) {
		return ulmapper.findpassword(id,userTel,Md5Util.md5(newpassword));
	}

	

	@Override
	public int addUser(UserLogin user, HttpSession session) {
			user.setUserPwd(Md5Util.md5(user.getUserPwd()));
			return ulmapper.insertSelective(user);
	}

	@Override
	public int editUser(UserInfo user, HttpSession session) {
			return uimapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public int insertUser(UserInfo user, HttpSession session) {
		return uimapper.insertSelective(user);
	}

}
