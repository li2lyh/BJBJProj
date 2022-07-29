package com.bjbj.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthLoginInterceptor implements HandlerInterceptor{
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		// 사용자의 로그인 여부 검사
		if(request.getSession().getAttribute("loginSession") == null) {
			// 로그인이 안되어있으면
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
	
}
