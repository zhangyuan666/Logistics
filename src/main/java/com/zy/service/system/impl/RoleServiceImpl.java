package com.zy.service.system.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.system.Auth;
import com.zy.entity.system.Role;
import com.zy.entity.system.Role_Auth;
import com.zy.mapper.system.RoleMapper;
import com.zy.mapper.system.Role_AuthMapper;
import com.zy.service.system.RoleService;
import com.zy.utils.UserUtil;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Resource
	private RoleMapper mapper;

	@Resource
	private Role_AuthMapper ramapper;

	@Override
	public DataGridResult query(Role role) {
		// TODO Auto-generated method stub
		DataGridResult rs = new DataGridResult();
		// 分页公式封装
		role.setPage((role.getPage() - 1) * role.getRows());
		rs.setRows(mapper.selectRowsList(role));
		rs.setTotal(mapper.count(role));
		return rs;
	}

	@Override
	public int addRole(Role role, HttpSession session) {
		// TODO Auto-generated method stub
		role.setCreateid(UserUtil.userid(session));
		role.setCreatetime(new Date());
		int res = mapper.insertSelective(role);
		// 添加中间表Role_Auth
		for (String authid : role.getAuthIds()) {
			Role_Auth ra = new Role_Auth();
			ra.setAuthid(Integer.parseInt(authid));
			ra.setRoleid(role.getId());
			ramapper.insert(ra);
		}
		return res;
	}

	@Override
	public Role findById(Integer id) {
		// TODO Auto-generated method stub
		Role role = mapper.seclectOne(id);
		List<String> list = new ArrayList<String>();
		for (Auth auth : role.getAuths()) {
			list.add(String.valueOf(auth.getId()));
		}
		// id,id,id
		role.setAuthStr(String.join(",", list));
		return role;
	}

	@Override
	public int editRole(Role role, HttpSession session) {
		// TODO Auto-generated method stub
		role.setModifyid(UserUtil.userid(session));
		role.setModifytime(new Date());
		// 删除已有权限，然后添加新权限
		ramapper.deleteByRoleId(role.getId());
		for (String AuthId : role.getAuthIds()) {
			Role_Auth ra = new Role_Auth();
			ra.setAuthid(Integer.parseInt(AuthId));
			ra.setRoleid(role.getId());
			ramapper.insert(ra);
		}
		return mapper.updateByPrimaryKeySelective(role);
	}

	@Override
	public int remove(String ids) {
		// TODO Auto-generated method stub
		int res = 0;
		String[] data = ids.split(",");
		for (String id : data) {
			//先删除中间表
			ramapper.deleteByRoleId(Integer.parseInt(id));
			res += mapper.deleteByPrimaryKey(Integer.parseInt(id));
		}
		return res;
	}

	@Override
	public List<Role> roleCombobox() {
		// TODO Auto-generated method stub
		return mapper.roleCombobox();
	}

}
