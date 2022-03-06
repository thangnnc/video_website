package com.thangnnc.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.entities.Users;
import com.thangnnc.utils.HttpFilter;

@WebFilter({ "/*" })
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		String uri = req.getRequestURI();
		
		if(req.getSession().getAttribute("oldUrl") == null) {
			String path = req.getServletPath();
			String url = req.getRequestURL().toString();
			req.setAttribute("url", url.substring(0, url.length() - path.length()));
			req.getSession().setAttribute("oldUrl", url.substring(0, url.length() - path.length()) + "/home");
		}
		
		if((uri.contains("sign-in") || uri.contains("sign-up") 
				|| uri.contains("forget-password")) && req.getSession().getAttribute("myAccount") != null) {
			resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
		}else if((uri.contains("change-password") || uri.contains("update-account")
				|| uri.contains("my-account")) && req.getSession().getAttribute("myAccount") == null) {
			resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
		}else if(uri.contains("/admin") && req.getSession().getAttribute("myAccount") != null) {
			Users user = (Users) req.getSession().getAttribute("myAccount");
			if(!user.isAdmin()) {
				resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
			}else chain.doFilter(req, resp);
		}else if(uri.contains("/admin") && req.getSession().getAttribute("myAccount") == null) {
			resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
		} else chain.doFilter(req, resp);
	}
}
