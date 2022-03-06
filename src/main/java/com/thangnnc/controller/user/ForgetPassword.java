package com.thangnnc.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.UsersDao;
import com.thangnnc.entities.Users;
import com.thangnnc.utils.MailUtils;

@WebServlet("/forget-password")
public class ForgetPassword extends HttpServlet {

	private static final long serialVersionUID = 1L;

	int code;
	Users user;
	UsersDao dao = new UsersDao();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		if (username != null) {
			user = dao.findById(username);
			if (user == null) {
				req.setAttribute("message", "Username not exist!");
				req.getRequestDispatcher("/view/user/forget_password.jsp").forward(req, resp);
			} else {
				code = (int) Math.floor(Math.random() * (9999 - 1000 + 1) + 1000);
				try {
					MailUtils.sendEmail(user.getEmail(), "Forget Password", "" + code);
				} catch (Exception e) {
					e.printStackTrace();
				}
				req.getRequestDispatcher("/view/user/confirm_code.jsp").forward(req, resp);
			}
		} else if (req.getParameter("code") != null) {
			if (req.getParameter("code").equals(code + "")) {
				String password = req.getParameter("password");
				String confirm = req.getParameter("confirm");
				if (password.equals(confirm)) {
					user.setPassword(password);
					dao.update(user);
					req.setAttribute("message", "Change pass success!");
					req.getRequestDispatcher("/view/user/forget_password.jsp").forward(req, resp);
				} else {
					req.setAttribute("message", "Password and confirm password do not match!");
					req.getRequestDispatcher("/view/user/confirm_code.jsp").forward(req, resp);
				}
			} else {
				req.setAttribute("message", "Wrong Code!");
				req.getRequestDispatcher("/view/user/confirm_code.jsp").forward(req, resp);
			}
		} else
			req.getRequestDispatcher("/view/user/forget_password.jsp").forward(req, resp);
	};
}
