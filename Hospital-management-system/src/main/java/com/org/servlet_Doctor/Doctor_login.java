package com.org.servlet_Doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.DoctorDao;
import com.org.dto.Doctor;

@WebServlet("/doctor_login")
public class Doctor_login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
	
		DoctorDao dao=new DoctorDao();
		Doctor dr = dao.loginDoctor(email, password);
		HttpSession session = req.getSession();
		if(dr != null) {
			session.setAttribute("doctorObj", dr);
			
			resp.sendRedirect("Doctor/doctor_Home.jsp");
		}
		else {
			session.setAttribute("failed", "Invalid Email And Password");
			resp.sendRedirect("doctor_login.jsp");
		}
	}
}
