package com.thangnnc.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.utils.HttpFilter;

@WebFilter({ "/home", "/search", "/details-video", "/trending" })
public class OldLinkFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		chain.doFilter(req, resp);
		if (uri.contains("details-video")) {
			String href = req.getParameter("href");
			req.getSession().setAttribute("oldUrl", req.getRequestURL() + "?href=" + href);
		} else if (uri.contains("search")) {
			String keyword = req.getParameter("keyword");
			req.getSession().setAttribute("oldUrl", req.getRequestURL() + "?keyword=" + keyword);
		} else req.getSession().setAttribute("oldUrl", req.getRequestURL());
	}
}
