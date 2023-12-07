package com.org.servlet_User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oldPassword = req.getParameter("opd");
		String newPassword = req.getParameter("npd");
		int uid=Integer.parseInt(req.getParameter("uid"));
		UserDao dao=new UserDao();
		User user = dao.fetchByPassword(oldPassword);
		HttpSession session = req.getSession();
		if(user != null) {
			user.setId(uid);
			user.setPassword(newPassword);
			dao.saveUser(user);
			resp.sendRedirect("User/user_Home.jsp");
		}
		else {
			session.setAttribute("failed", "Incorrect Password");
			resp.sendRedirect("User/ChangePassword.jsp");
		}
	}
}
