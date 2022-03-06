package com.thangnnc.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.UsersDao;
import com.thangnnc.entities.Users;
import com.thangnnc.utils.XCookie;

@WebServlet({ "/sign-in", "/sign-out" })
public class SignIn extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI().toString();
		XCookie cookie = new XCookie(req,resp);
		
		if(uri.contains("sign-out")) {
			req.getSession().removeAttribute("myAccount");
			resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
		} else if(req.getMethod().equalsIgnoreCase("post")){
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			if (username != null) {
				UsersDao dao = new UsersDao();
				Users user = dao.findById(username);
				if (user == null) {
					req.setAttribute("message", "Username not exist!");
					req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
				} else if (!user.getPassword().equals(password)) {
					req.setAttribute("message", "Wrong password! Please enter your password again!");
					req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
				} else {
					if(req.getParameter("remember") != null) {
						cookie.add("username", username, 30*24);
						cookie.add("password", password, 30*24);
					}
					
					req.getSession().setAttribute("myAccount", user);
					resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
				}
			} else req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
		}else req.getRequestDispatcher("/view/user/login.jsp").forward(req, resp);
		
	}

}
