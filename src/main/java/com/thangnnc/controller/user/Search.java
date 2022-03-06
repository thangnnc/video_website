package com.thangnnc.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Videos;

@WebServlet("/search")
public class Search extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideosDao dao = new VideosDao();
		List<Videos> results = dao.findByKeyword(req.getParameter("keyword"));
		
		req.setAttribute("results", results);
		req.getRequestDispatcher("/view/user/search.jsp").forward(req, resp);
	}
}
