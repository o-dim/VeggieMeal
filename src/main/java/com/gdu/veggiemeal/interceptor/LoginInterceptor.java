package com.gdu.veggiemeal.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("loginId") == null ) {
		      response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();
		      out.println("<script>");
		      out.println("alert('로그인이 필요한 기능입니다. 로그인 창으로 이동합니다'))");
		      out.println("location.href='" + request.getContextPath() + "/person/login.do\'");
		      out.println("</script>");
		      out.flush();
		      out.close();
		      return false;
		}
		return true;
	}
}
