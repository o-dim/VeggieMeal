package com.gdu.veggiemeal.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class RegisterInterceptor implements HandlerInterceptor {
	// 가입한 상황이면 다시 가입 못하게 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session != null && session.getAttribute("LoginId") != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당기능은 사용할 수 없습니다.')");
			out.println("location.href='" + request.getContextPath() + "/person/index.form';");
			out.println("</script>");
			out.flush();
			out.close();
			return false;
		}
		return true;
	}
}
