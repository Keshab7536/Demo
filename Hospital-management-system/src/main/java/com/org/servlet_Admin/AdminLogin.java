package com.org.servlet_Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dto.User;

@WebServlet("/admin")
public class AdminLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session=req.getSession();
		if(email.equals("admin@gmail.com") && password.equals("admin")) {
			session.setAttribute("adminObj", new User());
			resp.sendRedirect("Admin/admin_Home.jsp");
		}
		else {
			session.setAttribute("failed", "Invalid Email And Password");
			resp.sendRedirect("admin_login.jsp");
		}
	}
}
