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
@WebServlet("/register")
public class UserRegister extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		long adhar=Long.parseLong(req.getParameter("adhar"));
		long mobile=Long.parseLong(req.getParameter("mobile"));
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		User user=new User();
		user.setName(name);
		user.setAdhar(adhar);
		user.setMobile(mobile);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDao dao=new UserDao();
		dao.saveUser(user);
		
		HttpSession session = req.getSession();
		session.setAttribute("success", "Register Successfull");
		
		resp.sendRedirect("Register.jsp");
	}
}
