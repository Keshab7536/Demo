package com.org.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.Appointment;
import com.org.dto.Doctor;
import com.org.dto.User;

public class AppointmentDao {
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
	public void saveAppointment(Appointment ap) {
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		et.begin();
		em.merge(ap);
		et.commit();
	}
	public List<Appointment> fetchAppointmentByUser(User user) {
		EntityManager em=emf.createEntityManager();
		String jpql="Select s from Appointment s where s.user=?1";
		Query query = em.createQuery(jpql);
		query.setParameter(1, user);
		List<Appointment> list = query.getResultList();
		return list;
	}
	public List<Appointment> fetchAppointmentByDoctor(Doctor dr) {
		EntityManager em=emf.createEntityManager();
		String jpql="Select s from Appointment s where s.doctor=?1";
		Query query = em.createQuery(jpql);
		query.setParameter(1, dr);
		List<Appointment> list = query.getResultList();
		return list;
	}
	public Appointment fetchById(int apId) {
		EntityManager em=emf.createEntityManager();
		Appointment ap = em.find(Appointment.class, apId);
		
		return ap;
	}
	public List<Appointment> fetchAllAppointment(){
		
		EntityManager em=emf.createEntityManager();
		String jpql="select s from Appointment s";
		Query query = em.createQuery(jpql);
		List<Appointment> list = query.getResultList();
		return list;
	}
}
