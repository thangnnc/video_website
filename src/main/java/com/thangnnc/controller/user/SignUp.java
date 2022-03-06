package com.thangnnc.controller.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.thangnnc.dao.UsersDao;
import com.thangnnc.entities.Users;

@WebServlet("/sign-up")
@MultipartConfig
public class SignUp extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String rePassword = req.getParameter("confirm-password");
			UsersDao dao = new UsersDao();
			if (dao.findById(username) != null) {
				req.setAttribute("message", "Username is exists!");
			} else if (!password.equals(rePassword)) {
				req.setAttribute("message", "Password and Re-Password do not match");
			} else {
				Users user = new Users();
				user.setUsername(username);
				user.setPassword(password);
				user.setFullname(req.getParameter("fullname"));
				user.setEmail(req.getParameter("email"));
				user.setImage(req.getParameter("username") + ".jpg");
				user.setAdmin(false);
				user.setActive(true);
				writeImage(req, resp, user.getImage());
				try {
					dao.create(user);
					req.setAttribute("message", "Sign up new account success!");
				} catch (Exception e) {
					req.setAttribute("message", e.getMessage());
				}
			}
		}
		req.getRequestDispatcher("/view/user/signup.jsp").forward(req, resp);
	}

	private void writeImage(HttpServletRequest req, HttpServletResponse resp, String imageName)
			throws ServletException, IOException {
		// Get directory path from the root of the websiteWW
		File direct = new File(req.getServletContext().getRealPath("/templates/images/auth"));
		// If directory don't exist, It will create directory
		if (!direct.exists())
			direct.mkdirs();

		// Save uploaded files to directory
		// Photo File
		Part photo = req.getPart("photo");
		File photoFile = new File(direct, imageName);
		photo.write(photoFile.getAbsolutePath());
	}
}
