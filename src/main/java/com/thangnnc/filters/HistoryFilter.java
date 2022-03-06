package com.thangnnc.filters;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.HistoriesDao;
import com.thangnnc.dao.VideosDao;
import com.thangnnc.entities.Histories;
import com.thangnnc.entities.Users;
import com.thangnnc.utils.HttpFilter;

@WebFilter({ "/details-video" })
public class HistoryFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(req, resp);
		Users user = (Users) req.getSession().getAttribute("myAccount");
		if (user != null) {
			HistoriesDao dao = new HistoriesDao();
			String url =  req.getRequestURL().toString();
			String href = req.getParameter("href");
			dao.create(new Histories(user, new VideosDao().findById(href),new Timestamp(new Date().getTime()),url+"?href="+href));
		}
	}
}
