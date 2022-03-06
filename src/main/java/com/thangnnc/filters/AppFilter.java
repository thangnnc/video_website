package com.thangnnc.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.UsersDao;
import com.thangnnc.entities.Users;
import com.thangnnc.utils.HttpFilter;
import com.thangnnc.utils.XCookie;

@WebFilter({"/*"})
public class AppFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		// Check remember user
		XCookie cookie = new XCookie(req,resp);
		if(req.getRequestURI().contains("sign-out")) {
			cookie.remove("username");
			cookie.remove("password");
		} else if(cookie.get("username", null) != null && cookie.get("password", null) != null 
				&& req.getSession().getAttribute("myAccount") == null) {
			String username = cookie.get("username", null);
			String password = cookie.get("password", null);
			Users user = new UsersDao().findById(username);
			if(password.equals(user.getPassword())) {
				req.getSession().setAttribute("myAccount", user);
				cookie.add("username", username, 30*24);
				cookie.add("password", password, 30*24);
			}
		}
		
		
		// set attribute url(ex: http://localhost8080/thangnnc_lab8)
		String path = req.getServletPath();
		String url = req.getRequestURL().toString();
		req.setAttribute("url", url.substring(0, url.length() - path.length()));
		// set attribute uri(ex: /thangnnc_lab8)
		req.setAttribute("uri", req.getServletContext().getContextPath());
		chain.doFilter(req, resp);
		
		
//		String lang = req.getParameter("lang");
//		if(lang != null) {
//			req.getSession().setAttribute("lang", lang);
//			if(uri.contains("product-detail")) {
//			}else resp.sendRedirect(req.getRequestURL().toString());
//		}else  chain.doFilter(req, resp);
	}
}
