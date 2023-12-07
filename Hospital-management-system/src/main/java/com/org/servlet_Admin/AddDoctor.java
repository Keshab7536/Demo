package com.org.servlet_Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.DoctorDao;
import com.org.dto.Doctor;

@WebServlet("/doctor")
public class AddDoctor extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String DOB = req.getParameter("dob");
		String Specialist = req.getParameter("spec");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		long mobile = Long.parseLong(req.getParameter("mobile"));
		String password = req.getParameter("password");
		
		Doctor d=new Doctor();
		d.setName(name);
		d.setDob(DOB);
		d.setSpecialist(Specialist);
		d.setQal(qualification);
		d.setEmail(email);
		d.setMobile(mobile);
		d.setPassword(password);
		
		DoctorDao dao=new DoctorDao();
		Doctor dr = dao.addDoctor(d);
		
		
			HttpSession session = req.getSession();
			session.setAttribute("success", "Doctor Add Successfull");
			
			resp.sendRedirect("Admin/admin_Home.jsp");
		
	}
}
