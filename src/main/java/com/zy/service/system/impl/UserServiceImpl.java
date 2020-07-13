package com.zy.service.system.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.system.Auth;
import com.zy.entity.system.Role;
import com.zy.entity.system.User;
import com.zy.entity.system.User_Role;
import com.zy.mapper.system.RoleMapper;
import com.zy.mapper.system.Role_AuthMapper;
import com.zy.mapper.system.UserMapper;
import com.zy.mapper.system.User_RoleMapper;
import com.zy.service.system.UserService;
import com.zy.utils.Md5Util;
import com.zy.utils.UserUtil;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper mapper;

	@Resource
	private User_RoleMapper urmapper;

	@Resource
	private RoleMapper rmapper;

	@Resource
	private Role_AuthMapper ramapper;

	@Override
	public User login(String id, String password) {
		// TODO Auto-generated method stub
		User u = mapper.selectOne(id);

		// System.out.println("md5密码：" + Md5Util.md5(password));

		// 如果u为null或者输入的密码和数据库不一样
		if (u == null || !u.getPassword().equals(Md5Util.md5(password))) {
			u = null;
		} else {
			// 通过角色获得权限
			// 存储权限集合
			List<Auth> auths = new ArrayList<>();
			// 获取user的角色
			List<Role> roles = u.getRoles();
			if (roles != null) {
				// 通过角色id来查询角色对应的权限
				for (Role role : roles) {
					Role r = rmapper.seclectOne(role.getId());
					auths.addAll(r.getAuths());
				}
			}
			// 用String来存储权限url
			List<String> authList = new ArrayList<>();
			for (Auth auth : auths) {
				authList.add(auth.getUrl());
			}
			u.setAuthStr(String.join(",", authList));
		}
		return u;
	}

	@Override
	public int editpassword(String id, String oldpassword, String newpassword) {
		// TODO Auto-generated method stub

		return mapper.editpassword(id, Md5Util.md5(oldpassword), Md5Util.md5(newpassword));
	}

	@Override
	public DataGridResult query(User user) {
		// TODO Auto-generated method stub

		DataGridResult rs = new DataGridResult();
		// 分页公式封装
		user.setPage((user.getPage() - 1) * user.getRows());
		rs.setRows(mapper.selectRowsList(user));
		rs.setTotal(mapper.count(user));
		return rs;
	}

	@Override
	public int remove(String ids) {
		// TODO Auto-generated method stub
		int res = 0;
		String[] data = ids.split(",");
		for (String id : data) {
			urmapper.deleteByUserId(id);
			res += mapper.deleteByPrimaryKey(id);
		}
		return res;
	}

	@Override
	public int addUser(User user, HttpSession session) {
		// TODO Auto-generated method stub
		user.setStatus("0");
		user.setCreateid(UserUtil.userid(session));
		user.setCreatetime(new Date());
		user.setPassword(Md5Util.md5(user.getPassword()));
		// 先添加system_user表 否则system_user_role找不到外键
		int res = mapper.insertSelective(user);
		// 同时添加角色（system_user_role）
		if (user.getRoleIds() != null) {
			for (String roleId : user.getRoleIds()) {
				User_Role ur = new User_Role();
				ur.setRoleid(Integer.parseInt(roleId));
				ur.setUserid(user.getId());
				urmapper.insert(ur);
			}
		}
		return res;
	}

	@Override
	public User checkid(String id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int resetPwd(String ids) {
		// TODO Auto-generated method stub
		int res = 0;
		String[] data = ids.split(",");
		for (String id : data) {
			User u = mapper.selectByPrimaryKey(id);
			u.setPassword(Md5Util.md5("1234"));
			res += mapper.updateByPrimaryKey(u);
		}
		return res;
	}

	@Override
	public int editUser(User user, HttpSession session) {
		// TODO Auto-generated method stub
		user.setModifyid(UserUtil.userid(session));
		user.setModifytime(new Date());
		if (!StringUtils.isEmpty(user.getPassword())) {
			user.setPassword(Md5Util.md5(user.getPassword()));
		}
		// 删除角色
		urmapper.deleteByUserId(user.getId());
		// 同时添加角色（system_user_role）
		if (user.getRoleIds() != null) {
			for (String roleId : user.getRoleIds()) {
				User_Role ur = new User_Role();
				ur.setRoleid(Integer.parseInt(roleId));
				ur.setUserid(user.getId());
				urmapper.insert(ur);
			}
		}
		return mapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<Role> roleCombobox() {
		// TODO Auto-generated method stub
		return rmapper.roleCombobox();
	}

	@Override
	public List<User_Role> setValues(String id) {
		// TODO Auto-generated method stub
		return urmapper.setValues(id);
	}

	@Override
	public int imp(MultipartFile userFile, HttpSession session) {
		// TODO Auto-generated method stub
		// 定义总数
		int count = 0;
		// 定义Workbook
		Workbook readwb = null;
		try {
			// 上传本地文件
			// userFile.transferTo(new File("D:\\upload\\file.txt"));
			if (!userFile.isEmpty()) {
				// 获得输入流
				InputStream instream = userFile.getInputStream();
				// 从输入流获取Workbook
				readwb = Workbook.getWorkbook(instream);
				// 获取页签
				Sheet readsheet = readwb.getSheet(0);
				// 获取列
				int rsColumns = readsheet.getColumns();
				// 获取行
				int rsRows = readsheet.getRows();
				// 遍历行（由于第一行是标题，从第二行开始载入数据即i=1）
				for (int i = 1; i < rsRows; i++) {
					User user = new User();
					user.setStatus("0");
					user.setCreateid(UserUtil.userid(session));
					user.setCreatetime(new Date());
					// 遍历列
					for (int j = 0; j < rsColumns; j++) {
						// 从页签获取坐标（j,i）元素
						Cell cell = readsheet.getCell(j, i);
						switch (j) {
						case 0:
							user.setId(cell.getContents());
							continue;
						case 1:
							user.setName(cell.getContents());
							continue;
						case 2:
							user.setPassword(Md5Util.md5(cell.getContents()));
							continue;
						default:
							break;
						}
					}
					// 存入user对象
					count += this.mapper.insertSelective(user);
				}
			}
		} catch (IllegalStateException | IOException | BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	@Override
	public List<User> list() {
		// TODO Auto-generated method stub
		//设置分页第1页2行
		PageHelper.startPage(1,2);
		List<User> list = mapper.list();
		
		PageInfo<User> info = new PageInfo<>(list);
		System.out.println("总数total:"+info.getTotal());
		return list;
	}

}
