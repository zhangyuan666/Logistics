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

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional
public class ClientServiceImpl implements ClientService {

	@Resource
	private UserLoginMapper ulmapper;

	@Resource
	private UserInfoMapper uimapper;

	/**
	 * 
	 * @MethodName: login
	 * @param id
	 * @param password
	 * @return
	 * @see com.zy.service.client.ClientService#login(java.lang.String,
	 *      java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:09
	 */
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

	/**
	 * 
	 * @MethodName: selectone
	 * @param id
	 * @return
	 * @see com.zy.service.client.ClientService#selectone(java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:22
	 */
	@Override
	public UserLogin selectone(String id) {
		// TODO Auto-generated method stub
		UserLogin u = ulmapper.selectOne(id);
		return u;
	}

	/**
	 * 
	 * @MethodName: editpassword
	 * @param id
	 * @param oldpassword
	 * @param newpassword
	 * @return
	 * @see com.zy.service.client.ClientService#editpassword(java.lang.String,
	 *      java.lang.String, java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:25
	 */
	@Override
	public int editpassword(String id, String oldpassword, String newpassword) {
		return ulmapper.editpassword(id, Md5Util.md5(oldpassword), Md5Util.md5(newpassword));
	}

	/**
	 * 
	 * @MethodName: findpassword
	 * @param id
	 * @param userTel
	 * @param newpassword
	 * @return
	 * @see com.zy.service.client.ClientService#findpassword(java.lang.String,
	 *      java.lang.String, java.lang.String)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:28
	 */
	@Override
	public int findpassword(String id, String userTel, String newpassword) {
		return ulmapper.findpassword(id, userTel, Md5Util.md5(newpassword));
	}

	/**
	 * 
	 * @MethodName: addUser
	 * @param user
	 * @param session
	 * @return
	 * @see com.zy.service.client.ClientService#addUser(com.zy.entity.client.UserLogin,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:31
	 */
	@Override
	public int addUser(UserLogin user, HttpSession session) {
		user.setUserPwd(Md5Util.md5(user.getUserPwd()));
		return ulmapper.insertSelective(user);
	}

	/**
	 * 
	 * @MethodName: editUser
	 * @param user
	 * @param session
	 * @return
	 * @see com.zy.service.client.ClientService#editUser(com.zy.entity.client.UserInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:34
	 */
	@Override
	public int editUser(UserInfo user, HttpSession session) {
		return uimapper.updateByPrimaryKeySelective(user);
	}

	/**
	 * 
	 * @MethodName: insertUser
	 * @param user
	 * @param session
	 * @return
	 * @see com.zy.service.client.ClientService#insertUser(com.zy.entity.client.UserInfo,
	 *      javax.servlet.http.HttpSession)
	 * @Description: TODO
	 * @date 2020-07-16 07:20:37
	 */
	@Override
	public int insertUser(UserInfo user, HttpSession session) {
		return uimapper.insertSelective(user);
	}

}
