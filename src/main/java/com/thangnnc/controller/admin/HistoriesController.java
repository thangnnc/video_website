package com.thangnnc.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.thangnnc.dao.HistoriesDao;
import com.thangnnc.entities.Histories;

@WebServlet("/admin/histories")
@MultipartConfig
public class HistoriesController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HistoriesDao dao = new HistoriesDao();
		List<Histories> list = new ArrayList<>();
		System.out.println(req.getParameter("typeSearch"));
		if (req.getParameter("typeSearch") == null || req.getParameter("typeSearch").equals("1")) {
			list = dao.findAll();
		} else {
			String username= "";
			System.out.println(username);
			if(req.getParameter("username") != null) username = req.getParameter("username");
			list = dao.findByUsername(username);
			req.setAttribute("username", username);
		}

		int size = list.size();
		int surplus = size % 5;
		int page = size / 5;
		if (surplus != 0)
			page++;
		List<Histories> result = new ArrayList<>();
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
		req.setAttribute("list", result);
		req.getRequestDispatcher("/view/admin/search_history.jsp").forward(req, resp);

	}
}
