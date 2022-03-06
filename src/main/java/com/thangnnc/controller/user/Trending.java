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

@WebServlet("/trending")
public class Trending extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		VideosDao dao = new VideosDao();
		List<Videos> listTrending = dao.findTop16Trending();
		
		req.setAttribute("listTrending", listTrending);
		req.getRequestDispatcher("/view/user/trending.jsp").forward(req, resp);
	}
}
