package com.zy.utils;

import javax.servlet.http.HttpSession;

import com.zy.entity.system.User;

public class UserUtil {
	public static String userid(HttpSession session) {
		// TODO Auto-generated method stub
		String userid = null;
		Object obj = session.getAttribute("user");
		if (obj != null) {
			User user = (User) obj;
			userid = user.getId();
		}
		return userid;
	}
}
