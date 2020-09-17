package com.yedam.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Encoding implements Filter {
	private String encoding = null;
	protected FilterConfig filterConfig = null;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (request.getCharacterEncoding() == null) {
			if (encoding != null) {
				request.setCharacterEncoding(encoding);
				System.out.println("encoding: " + encoding);
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		this.filterConfig = null;
		this.encoding = null;
	}

}
