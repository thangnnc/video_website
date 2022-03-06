package com.thangnnc.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Favorites;
import com.thangnnc.entities.Videos;

@WebServlet({"/admin/favorite-user"})
public class FavoriteUsers extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		UsersDao dao = new UsersDao();
		VideosDao vdDao = new VideosDao();
		List<Videos> listSearch = vdDao.findAll();
		req.setAttribute("listSearch", listSearch);
		
		if(req.getMethod().equalsIgnoreCase("post")) {
			if(req.getParameter("href") != null) {
				Videos video = vdDao.findById(req.getParameter("href"));
				req.setAttribute("video", video);
				separate(req, resp, video.getFavorites());
//				List<Report2> list = dao.findUserByFavoriteVideo(video.getTitle());
//				req.setAttribute("list", separate(req, resp, list));
			}else {
				if(req.getParameter("title") == null) {
					req.setAttribute("message", "Not found title video!");
				}else {
					Videos video = vdDao.findByTitle(req.getParameter("title"));
					if(video == null) {
						req.setAttribute("message", "Not found title video!");
//						video = new Videos();
//						video.setTitle(req.getParameter("title"));
//						req.setAttribute("video", video);
					}else {
						req.setAttribute("video", video);
						separate(req, resp, video.getFavorites());
//						List<Report2> list = dao.findUserByFavoriteVideo(video.getTitle());
//						req.setAttribute("list", separate(req, resp, list));
					}
				}
			}
			req.getRequestDispatcher("/view/admin/favorite_user.jsp").forward(req, resp);
		}else req.getRequestDispatcher("/view/admin/favorite_user.jsp").forward(req, resp);
		
	}

	private List<Favorites> separate(HttpServletRequest req, HttpServletResponse resp, List<Favorites> list)
			throws ServletException, IOException {
		int size = list.size();
		int surplus = size % 5;
		int page = size / 5;
		if (surplus != 0)
			page++;
		List<Favorites> result = new ArrayList<>();
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
	
//	
//	private List<Report2> separate(HttpServletRequest req, HttpServletResponse resp, List<Report2> list)
//			throws ServletException, IOException {
//		int size = list.size();
//		int surplus = size % 5;
//		int page = size / 5;
//		if (surplus != 0)
//			page++;
//		List<Report2> result = new ArrayList<>();
//		int input = 1;
//		try {
//			input = Integer.valueOf(req.getParameter("page"));
//		} catch (Exception e) {
//		}
//		if (input < page || (input == page && surplus == 0)) {
//			for (int i = (input - 1) * 5; i < input * 5; i++) {
//				result.add(list.get(i));
//			}
//		} else if (input == page && surplus != 0) {
//			for (int i = (input - 1) * 5; i < (input - 1) * 5 + surplus; i++) {
//				result.add(list.get(i));
//			}
//		}
//		req.setAttribute("page", page);
//		req.setAttribute("pageSelect", input);
//		return result;
//	}
}
