package com.thangnnc.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Videos;

@WebServlet({ "/admin/videos-manager", "/admin/create-video", "/admin/update-video", "/admin/delete-video",
		"/admin/active-video" })
@MultipartConfig
public class VideosManager extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("videos-manager")) {
			VideosDao dao = new VideosDao();
			String type = "true";
			if(req.getParameter("active") != null) type =req.getParameter("active");
			req.setAttribute("active", type);
			if (req.getParameter("search") != null) {
				List<Videos> list;
				switch (type) {
				case "true": {
					list = dao.findByKeywordActive(req.getParameter("search"));
					break;
				}
				case "false": {
					list = dao.findByKeywordInActive(req.getParameter("search"));
					break;
				}
				default: {
					list = dao.findByKeyword(req.getParameter("search"));
					break;
				}
				}

				req.setAttribute("list", separate(req, resp, list));
			} else {
				// list video
				List<Videos> list;
				switch (type) {
					case "true": {
						list = dao.findActive();
						break;
					}
					case "false": {
						list = dao.findInActive();
						break;
					}
					default: {
						list = dao.findAll();
						break;
					}
				}
				req.setAttribute("list", separate(req, resp, list));
			}
			req.getRequestDispatcher("/view/admin/videos_manager.jsp").forward(req, resp);
		} else if (uri.contains("create")) {
			create(req, resp);
		} else if (uri.contains("update")) {
			update(req, resp);
		} else if (uri.contains("delete")) {
			delete(req, resp);
		} else if (uri.contains("active")) {
			active(req, resp);
		}

	}

	private void listUser(HttpServletRequest req) throws ServletException, IOException {
		// list video
		VideosDao dao = new VideosDao();
		List<Videos> list = dao.findAll();
		req.setAttribute("list", list);
	}

	private void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			Videos video = new Videos();
			video.setHref(req.getParameter("href"));
			VideosDao dao = new VideosDao();
			String mess = "";
			if (dao.findById(video.getHref()) == null) {
				try {
					video.setTitle(req.getParameter("title"));
					video.setVideoTime(req.getParameter("time"));
					video.setViews(0);
					video.setDescription(req.getParameter("description"));
					video.setDateUpload(new Timestamp(System.currentTimeMillis()));
					video.setActive(true);
					dao.create(video);
					mess = "Create video success!";
				} catch (Exception e) {
					mess = "Create video fail!" + e.getMessage();
				}
			} else
				mess = "User is existed!";
			listUser(req);
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager?message=" + mess);
		} else
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager");
	}

	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			VideosDao dao = new VideosDao();
			Videos video = dao.findById(req.getParameter("href"));
			String mess = "";
			try {
				video.setTitle(req.getParameter("title"));
				video.setVideoTime(req.getParameter("time"));
				video.setDescription(req.getParameter("description"));
				dao.update(video);
				mess = "Update video success!";
			} catch (Exception e) {
				mess = "Update video fail!" + e.getMessage();
				e.printStackTrace();
			}
			listUser(req);
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager?message=" + mess);
		} else {
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager");
		}
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			VideosDao dao = new VideosDao();
			String mess = "";
			try {
				dao.delete(req.getParameter("href"));
				mess = "Delete video success!";
				listUser(req);
			} catch (Exception e) {
				mess = "Delete video fail!" + e.getMessage();
			}
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager?message=" + mess);
		} else {
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager");
		}
	}

	private void active(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getMethod().equalsIgnoreCase("POST")) {
			VideosDao dao = new VideosDao();
			String mess = "";
			try {
				dao.active(req.getParameter("href"));
				mess = "Video is actived!";
				listUser(req);
			} catch (Exception e) {
				mess = "Active video fail!" + e.getMessage();
			}
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager?message=" + mess);
		} else {
			resp.sendRedirect(req.getAttribute("url") + "/admin/videos-manager");
		}
	}

	private List<Videos> separate(HttpServletRequest req, HttpServletResponse resp, List<Videos> list)
			throws ServletException, IOException {
		int size = list.size();
		int surplus = size % 5;
		int page = size / 5;
		if (surplus != 0)
			page++;
		List<Videos> result = new ArrayList<>();
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
