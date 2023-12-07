package com.org.servlet_Appointment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.AppointmentDao;
import com.org.dao.DoctorDao;
import com.org.dao.UserDao;
import com.org.dto.Appointment;
import com.org.dto.Doctor;
import com.org.dto.User;

@WebServlet("/user_ap")
public class AppointmentServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender = req.getParameter("gender");
		String appoinmentDate = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String disease = req.getParameter("disease");
		long phone = Long.parseLong(req.getParameter("phone"));
		String doctorId = req.getParameter("doct");
		int doctid=Integer.parseInt(doctorId);
		String address = req.getParameter("address");
		String userId = req.getParameter("userId");
		int uid=Integer.parseInt(userId);
		DoctorDao dao=new DoctorDao();
		Doctor doctor = dao.fetchById(doctid);
		
		UserDao udao=new UserDao();
		User user = udao.fetchById(uid);
		
		Appointment ap=new Appointment();
		ap.setName(name);
		ap.setAge(age);
		ap.setGender(gender);
		ap.setDate(appoinmentDate);
		ap.setEmail(email);
		ap.setDis(disease);
		ap.setPhone(phone);
		ap.setDoctorName(doctor.getName());
		ap.setAddress(address);
		ap.setUser(user);
		ap.setDoctor(doctor);
		ap.setStatus("Pending");
		
		AppointmentDao apDao=new AppointmentDao();
		apDao.saveAppointment(ap);
		
		HttpSession session=req.getSession();
		session.setAttribute("success", "Appointment addedd successfully");
		
		resp.sendRedirect("User/User_appointment.jsp");
	}
}
