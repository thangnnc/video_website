package com.thangnnc.controller.user;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.FavoritesDao;
import com.thangnnc.dao.LikesDao;
import com.thangnnc.dao.SharesDao;
import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Shares;
import com.thangnnc.entities.Users;
import com.thangnnc.utils.MailUtils;

@WebServlet({ "/like","/dislike","/favorite","/share"})
public class LikeOrFavorite extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		String url = req.getRequestURL().toString();
		req.setAttribute("url", url.substring(0, url.length() - path.length()));
		String uri = req.getRequestURI().toString();
		req.setAttribute("uri", uri.substring(0, uri.length() - path.length()));
		String href = req.getParameter("href");
		if(uri.contains("favorite")) {
			Users user = (Users) req.getSession().getAttribute("myAccount");
			FavoritesDao daoF = new FavoritesDao();
			daoF.updateFavorite(new VideosDao().findById(href), user);
			req.getSession().setAttribute("myAccount",user);
			resp.sendRedirect(url.substring(0, url.length() - path.length())+"/details-video?href="+href);
		}else if(uri.contains("/like")) {
			Users user = (Users) req.getSession().getAttribute("myAccount");
			LikesDao daoL = new LikesDao();
			daoL.updateLike(new VideosDao().findById(href), user, true);
			resp.sendRedirect(url.substring(0, url.length() - path.length())+"/details-video?href="+href);
		}else if(uri.contains("/dislike")) {
			Users user = (Users) req.getSession().getAttribute("myAccount");
			LikesDao daoL = new LikesDao();
			daoL.updateLike(new VideosDao().findById(href), user, false);
			resp.sendRedirect(url.substring(0, url.length() - path.length())+"/details-video?href="+href);
		}else if(uri.contains("/share")) {
			Users user = (Users) req.getSession().getAttribute("myAccount");
			SharesDao dao = new SharesDao();
			String email = req.getParameter("email");
			String message = "";
			try {
				MailUtils.sendEmail(email,"Share link",url.substring(0, url.length() - path.length())+"/details-video?href="+href);
				dao.create(new Shares(user, new VideosDao().findById(href), email, new Date()));
				message = "Send mail success!";
			} catch (Exception e) {
				e.printStackTrace();
				message=  "Send mail fail! "+e.getMessage();
			}
			resp.sendRedirect(url.substring(0, url.length() - path.length())+"/details-video?href="+href+"&message="+message);
		}else {
			req.getRequestDispatcher("/view/user/index.jsp").forward(req, resp);
		}
	}

}
