package com.thangnnc.controller.user;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.CommentsDao;
import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Comments;
import com.thangnnc.entities.Users;
import com.thangnnc.entities.Videos;

@WebServlet("/comment")
public class CommentController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmt = req.getParameter("cmt");
		Users user = (Users) req.getSession().getAttribute("myAccount");
		Videos video = new VideosDao().findById(req.getParameter("href"));
		if (cmt != null && video != null && user != null) {
			CommentsDao dao = new CommentsDao();
			dao.create(new Comments(user, video, cmt, new Date()));
			resp.sendRedirect(req.getAttribute("url")+"/details-video?href="+video.getHref());
		}else resp.sendRedirect(req.getSession().getAttribute("oldUrl").toString());
	}
}
