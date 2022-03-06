package com.thangnnc.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.FavoritesDao;
import com.thangnnc.dao.LikesDao;
import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Users;
import com.thangnnc.entities.Videos;

@WebServlet("/details-video")
public class DetailsVideo extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideosDao dao = new VideosDao();
		Videos video = dao.findById(req.getParameter("href"));

		if (video == null) {
			req.getRequestDispatcher("/view/user/available.jsp").forward(req, resp);
		} else {
			if (req.getSession().getAttribute("myAccount") != null) {
				Users user = (Users) req.getSession().getAttribute("myAccount");
				FavoritesDao daoF = new FavoritesDao();
				boolean favorite = daoF.checkFavorite(user.getUsername(), video.getHref());
				LikesDao daoL = new LikesDao();
				Boolean like = daoL.checkLike(user.getUsername(), video.getHref());
				if (favorite){
					req.setAttribute("isFavorite", favorite);
					req.setAttribute("countFavorite", daoF.countFavorite(video.getHref()));
				}
				if (like != null)
					req.setAttribute("isLike", like);
			}

			// set views + 1 when access into /details-video
			video.setViews(video.getViews() + 1);
			dao.update(video);

			List<Videos> listPopular = dao.findTop8Popular();
			req.setAttribute("listPopular", listPopular);
			req.setAttribute("like", dao.findLikeById(video.getHref()));
			req.setAttribute("dislike", dao.findUnlikeById(video.getHref()));
			req.setAttribute("video", video);
			req.getRequestDispatcher("/view/user/detail_video.jsp").forward(req, resp);
		}

	}
}
