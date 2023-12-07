package com.org.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.org.dto.Doctor;

public class counterDao {
	static EntityManagerFactory emf=Persistence.createEntityManagerFactory("keshab");
	
	public int countDoctor() {
		EntityManager em=emf.createEntityManager();
		Query query = em.createQuery("select s from Doctor s");
		return query.getResultList().size();
	}
	public int countSpecialist() {
		EntityManager em=emf.createEntityManager();
		Query query = em.createQuery("select s from Specialist s");
		return query.getResultList().size();
	}
	public int countAppointment() {
		EntityManager em=emf.createEntityManager();
		Query query = em.createQuery("select s from Appointment s");
		return query.getResultList().size();
	}
	public int countUser() {
		EntityManager em=emf.createEntityManager();
		Query query = em.createQuery("select s from User s");
		return query.getResultList().size();
	}
	public int countAppointmentByDoctor(Doctor dr) {
		EntityManager em=emf.createEntityManager();
		Query query = em.createQuery("select s from Appointment s where doctor=?1");
		query.setParameter(1, dr);
		return query.getResultList().size();
	}
}
