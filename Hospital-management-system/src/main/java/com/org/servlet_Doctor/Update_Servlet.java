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

@WebServlet("/update_Doctor")
public class Update_Servlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String dob=req.getParameter("dob");
		String spec=req.getParameter("spec");
		String qal=req.getParameter("qualification");
		String email=req.getParameter("email");
		long mobile =Long.parseLong(req.getParameter("mobile"));
		String password=req.getParameter("password");
		
		Doctor d=new Doctor();
		d.setId(id);
		d.setName(name);
		d.setDob(dob);
		d.setSpecialist(spec);
		d.setQal(qal);
		d.setEmail(email);
		d.setMobile(mobile);
		d.setPassword(password);
		
		DoctorDao dao=new DoctorDao();
		dao.addDoctor(d);
		
				
			resp.sendRedirect("Admin/view_Doctor.jsp");
		
		
	}
}
