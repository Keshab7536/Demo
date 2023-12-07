package com.org.servlet_Appointment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.org.dao.AppointmentDao;
import com.org.dto.Appointment;

@WebServlet("/update_comments")
public class UpdateComment_Servlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String comment = req.getParameter("comment");
		int apId=Integer.parseInt(req.getParameter("apId"));
		AppointmentDao dao=new AppointmentDao();
		Appointment ap = dao.fetchById(apId);
		ap.setId(apId);
		ap.setStatus(comment);
		
		
		
		dao.saveAppointment(ap);
		resp.sendRedirect("Doctor/Patient.jsp");
	}
}
