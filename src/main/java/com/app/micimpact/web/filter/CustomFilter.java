package com.app.micimpact.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CustomFilter implements Filter {
	public void init(FilterConfig fc) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filter) throws IOException, ServletException {
		filter.doFilter(new CustomHttpServletRequestWrapper((HttpServletRequest) request), response);
	}

	public void destroy() {

	}
}
