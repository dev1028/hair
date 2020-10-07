package com.yedam.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Login implements Filter {
	HashMap<String, String> list = null;
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;


		HttpSession sess = req.getSession();
		Object login = sess.getAttribute("login");
		String udong = (String) sess.getAttribute("udong");
		
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath(); // frontWeb
		String path = requestURI.substring(contextPath.length()); // memberInsert.do
		System.out.println(path);
		//String isIn = list.get(path);

		if (!path.equals("/hairshop/hairshopDesignerLogin.do") && !path.equals("/ajax/hairshopReturnToLogin.do")) {
			System.out.println("인증되지 않은 요청");
			if (udong == null || udong.trim().length() <= 0) {
				System.out.println("로그인안됨");
				res.sendRedirect("/hairapp/ajax/hairshopReturnToLogin.do");
				return;
			} else {
				System.out.println("있음");
			}
		} else {
			System.out.println("있음");
		}
		chain.doFilter(req, res);

	}

	public void init(FilterConfig fConfig) throws ServletException {
		list = new HashMap<String, String>();
		
	}

	public void destroy() {
	}

}
