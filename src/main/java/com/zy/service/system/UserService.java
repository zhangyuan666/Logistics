package com.zy.service.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.zy.entity.easyui.DataGridResult;
import com.zy.entity.system.Role;
import com.zy.entity.system.User;
import com.zy.entity.system.User_Role;

public interface UserService {

	User login(String id, String password);

	int editpassword(String id, String oldpassword, String newpassword);

	DataGridResult query(User user);

	int remove(String ids);

	int addUser(User user, HttpSession session);

	User checkid(String id);

	int resetPwd(String ids);

	int editUser(User user, HttpSession session);

	List<Role> roleCombobox();

	List<User_Role> setValues(String id);

	int imp(MultipartFile userFile, HttpSession session);

	List<User> list();

}
