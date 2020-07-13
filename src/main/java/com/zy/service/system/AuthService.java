package com.zy.service.system;

import java.util.List;

import com.zy.entity.easyui.TreeNode;
import com.zy.entity.system.Auth;

public interface AuthService {

	List<Auth> query();

	List<TreeNode> combotree();

	Auth selectByPrimaryKey(Integer id);

	int add(Auth auth);

	int editAuth(Auth auth);

	int remove(Integer id);

}
