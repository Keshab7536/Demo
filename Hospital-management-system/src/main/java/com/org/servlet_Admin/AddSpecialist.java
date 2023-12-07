package com.org.servlet_Admin;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dto.Specialist;
@WebServlet("/add_specialist")
public class AddSpecialist extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("specName");
		Specialist sp=new Specialist();
		sp.setName(name);
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.persist(sp);
		et.commit();
		
		HttpSession session = req.getSession();
		session.setAttribute("success", "Specialist Added");
		resp.sendRedirect("Admin/admin_Home.jsp");
				
	}
}

