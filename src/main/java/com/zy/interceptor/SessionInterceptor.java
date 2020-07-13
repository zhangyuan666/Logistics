package com.zy.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//String ajax = request.getHeader("x-requested-with");
		Object obj = request.getSession().getAttribute("user");

		if (obj == null) {
			response.sendRedirect(request.getContextPath() + "/page/noSession.action");
			// }
			return false;
		}
		System.out.println("Session拦截器生效");
		return true;
	}

}
