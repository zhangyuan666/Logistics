package com.zy.service.client;


import javax.servlet.http.HttpSession;


import com.zy.entity.client.UserInfo;
import com.zy.entity.client.UserLogin;

public interface ClientService {

	UserLogin login(String id, String password);

	int editpassword(String id, String oldpassword, String newpassword);
	
	int findpassword(String id, String newpassword, String userTel);





	int editUser(UserInfo user, HttpSession session);


	
	int addUser(UserLogin user, HttpSession session);

	UserLogin selectone(String id);

	int insertUser(UserInfo user, HttpSession session);

}
