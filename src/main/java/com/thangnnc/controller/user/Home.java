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

@WebServlet("/home")
public class Home extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		VideosDao dao = new VideosDao();
		List<Videos> listFeature = dao.findTop8Feature();
		List<Videos> listNew = dao.findTop8New();
		List<Videos> listPopular = dao.findTop8Popular();
		
		req.setAttribute("listFeature", listFeature);
		req.setAttribute("listNew", listNew);
		req.setAttribute("listPopular", listPopular);
		req.getRequestDispatcher("/view/user/index.jsp").forward(req, resp);
	}
}
