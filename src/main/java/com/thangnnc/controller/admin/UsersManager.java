package com.thangnnc.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.thangnnc.dao.UsersDao;
import com.thangnnc.entities.Users;

@WebServlet({ "/admin/users-manager","/admin/create-user","/admin/update-user","/admin/delete-user" })
@MultipartConfig
public class UsersManager extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("users-manager")) {
			UsersDao dao = new UsersDao();
			if (req.getParameter("search") != null) {
				List<Users> list = dao.findToKeyword(req.getParameter("search"));
				req.setAttribute("list", separate(req, resp, list));
			} else {
				// list user
				List<Users> list = dao.findAll();
				req.setAttribute("list", separate(req, resp, list));
			}
			req.getRequestDispatcher("/view/admin/users_manager.jsp").forward(req, resp);
		} else if (uri.contains("create")) {
			create(req, resp);
		} else if (uri.contains("update")) {
			update(req, resp);
		} else if (uri.contains("delete")) {
			delete(req, resp);
		}

	}

	private void listUser(HttpServletRequest req) throws ServletException, IOException {
		// list user
		UsersDao dao = new UsersDao();
		List<Users> list = dao.findAll();
		req.setAttribute("list", list);
	}

	private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			Users user = new Users();
			user.setUsername(req.getParameter("username"));
			UsersDao dao = new UsersDao();
			String mess="";
			if (dao.findById(user.getUsername()) == null) {
				try {
					user.setFullname(req.getParameter("fullname"));
					user.setPassword(req.getParameter("password"));
					user.setEmail(req.getParameter("email"));
					user.setAdmin(req.getParameter("admin").equals("true"));
					user.setImage(user.getUsername() + ".jpg");

					File direct = new File(req.getServletContext().getRealPath("templates/images/auth"));
					// Save uploaded files to directory
					// Photo File
					Part photo = req.getPart("photo");
					System.out.println(photo);
					File photoFile = new File(direct, user.getImage());
					photo.write(photoFile.getAbsolutePath());

					dao.create(user);
					mess = "Create user success!";
				} catch (Exception e) {
					mess = "Create user fail!" + e.getMessage();
				}
			} else mess = "User is existed!";
			listUser(req);
			resp.sendRedirect(req.getAttribute("url") + "/admin/users-manager?message="+mess);
		} else resp.sendRedirect(req.getAttribute("url")+"/admin/users-manager");
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			Users user = new Users();
			UsersDao dao = new UsersDao();
			String mess = "";
			try {
				user.setUsername(req.getParameter("username"));
				user.setFullname(req.getParameter("fullname"));
				user.setPassword(req.getParameter("password"));
				user.setEmail(req.getParameter("email"));
				user.setAdmin(req.getParameter("admin").equals("true"));
				user.setImage(user.getUsername() + ".jpg");
				if (!req.getParameter("check").equals("false")) {
					File direct = new File(req.getServletContext().getRealPath("templates/images/auth"));
					// Save uploaded files to directory
					// Photo File
					Part photo = req.getPart("photo");
					File photoFile = new File(direct, user.getImage());
					photo.write(photoFile.getAbsolutePath());
				}
				dao.update(user);
				mess = "Update user success!";
			} catch (Exception e) {
				mess = "Update user fail!" + e.getMessage();
				e.printStackTrace();
			}
			listUser(req);
			resp.sendRedirect(req.getAttribute("url") + "/admin/users-manager?message="+mess);
		} else {
			resp.sendRedirect(req.getAttribute("url") + "/admin/users-manager");
		}
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			UsersDao dao = new UsersDao();
			String mess = "";
			try {
				dao.delete(req.getParameter("username"));
				mess = "Delete user success!";
				listUser(req);
			} catch (Exception e) {
				mess = "Delete user fail!" + e.getMessage();
			}
			resp.sendRedirect(req.getAttribute("url") + "/admin/users-manager?message="+mess);
		} else {
			resp.sendRedirect(req.getAttribute("url") + "/admin/users-manager");
		}
	}
	
	private List<Users> separate(HttpServletRequest req, HttpServletResponse resp,List<Users> list) throws ServletException, IOException {
		int size = list.size();
		int surplus = size % 5;
		int page = size / 5;
		if (surplus != 0)
			page++;
		List<Users> result = new ArrayList<>();
		int input = 1;
		try {
			input = Integer.valueOf(req.getParameter("page"));
		} catch (Exception e) {
		}
		if (input < page || (input == page && surplus == 0)) {
			for (int i = (input - 1) * 5; i < input * 5; i++) {
				result.add(list.get(i));
			}
		} else if (input == page && surplus != 0) {
			for (int i = (input - 1) * 5; i < (input - 1) * 5 + surplus; i++) {
				result.add(list.get(i));
			}
		}
		req.setAttribute("page", page);
		req.setAttribute("pageSelect", input);
		return result;
	}
}
