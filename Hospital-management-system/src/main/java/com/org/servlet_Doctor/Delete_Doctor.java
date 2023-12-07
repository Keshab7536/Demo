package com.org.servlet_Doctor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.org.dao.DoctorDao;
import com.org.dto.Doctor;
@WebServlet("/Delete_doctor")
public class Delete_Doctor extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session=req.getSession();
		DoctorDao dao=new DoctorDao();
		boolean b = dao.deleteById(id);
		
		if(b) {
			
			resp.sendRedirect("Admin/view_Doctor.jsp");
		}
	}
}
