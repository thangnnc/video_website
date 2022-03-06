package com.thangnnc.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.UsersDao;
import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Users;
import com.thangnnc.entities.Videos;

@WebServlet({ "/my-account", "/change-password", "/update-account" })
public class MyAccount extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI().toString();

		if (req.getSession().getAttribute("myAccount") != null) {
			if (uri.contains("my-account")) {
				myAccount(req, resp);
			} else if (uri.contains("change-password")) {
				changePassword(req, resp);
			} else if (uri.contains("update-account")) {
				updateAccount(req, resp);
			}
		} else resp.sendRedirect(req.getSession().getAttribute("url") + "/home");
	}

	public void myAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getSession().getAttribute("myAccount");
		VideosDao dao = new VideosDao();
		List<Videos> results = dao.findVideoFavorite(user.getUsername());
		req.setAttribute("results", results);
		req.getRequestDispatcher("/view/user/user_account.jsp").forward(req, resp);
	}

	public void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("post")) {
			String oldPass = req.getParameter("old-password");
			String newPass = req.getParameter("new-password");
			String confirmPass = req.getParameter("confirm-password");
			Users user = (Users) req.getSession().getAttribute("myAccount");
			if (!user.getPassword().equals(oldPass)) {
				req.setAttribute("message", "Wrong password! Please enter old password again!");
			} else if (!newPass.equals(confirmPass)) {
				req.setAttribute("message", "Password and confirm password do not match");
			} else {
				user.setPassword(newPass);
				UsersDao dao = new UsersDao();
				try {
					dao.update(user);
					req.getSession().setAttribute("myAccount", user);
					req.setAttribute("message", "Change password success!");
				} catch (Exception e) {
					req.setAttribute("message", "Error: " + e.getMessage());
				}
			}
		}
		req.getRequestDispatcher("/view/user/change_password.jsp").forward(req, resp);
	}

	public void updateAccount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("post")) {
			Users user = (Users) req.getSession().getAttribute("myAccount");
			user.setFullname(req.getParameter("fullname"));
			user.setEmail(req.getParameter("email"));
			UsersDao dao = new UsersDao();
			try {
				dao.update(user);
				req.getSession().setAttribute("myAccount", user);
				req.setAttribute("message", "Update account success!");
			} catch (Exception e) {
				req.setAttribute("message", "Error: " + e.getMessage());
			}
		}
		req.getRequestDispatcher("/view/user/update_account.jsp").forward(req, resp);
	}
}
