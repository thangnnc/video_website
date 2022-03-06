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
import com.thangnnc.dto.Report;

@WebServlet({"/admin/favorite-video"})
public class FavoriteVideos extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideosDao dao = new VideosDao();
		List<Report> list = dao.findFavoriteVideo();
		req.setAttribute("list", separate(req, resp, list));
		req.getRequestDispatcher("/view/admin/favorite_video.jsp").forward(req, resp);
	}
	private List<Report> separate(HttpServletRequest req, HttpServletResponse resp, List<Report> list)
			throws ServletException, IOException {
		int size = list.size();
		int surplus = size % 5;
		int page = size / 5;
		if (surplus != 0)
			page++;
		List<Report> result = new ArrayList<>();
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
