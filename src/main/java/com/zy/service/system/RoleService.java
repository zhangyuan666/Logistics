package com.zy.service.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.system.Role;

public interface RoleService {

	DataGridResult query(Role role);

	int addRole(Role role, HttpSession session);

	Role findById(Integer id);

	int editRole(Role role, HttpSession session);

	int remove(String ids);

	List<Role> roleCombobox();

}
